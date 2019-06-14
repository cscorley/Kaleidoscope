/* -*- mode: c++ -*-
 * Kaleidoscope-Simulator -- A C++ testing API for the Kaleidoscope keyboard 
 *                         firmware.
 * Copyright (C) 2019  noseglasses (shinynoseglasses@gmail.com)
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include "AssertionQueue.h"
#include "KeyboardReport.h"
#include "MouseReport.h"
#include "AbsoluteMouseReport.h"
#include "assertions/generic_report/ReportAssertion.h"

#include "HIDReportConsumer_.h"

#include <vector>
#include <functional>

namespace kaleidoscope {
namespace simulator {
   
class Simulator;
class Assertion_;

template<typename _T>
struct Type2Type {};

template<typename _ReportType>
struct ReportTraits {};

enum {
   AnyTypeReportSid = 0,
   KeyboardReportSid = 1,
   MouseReportSid = 2,
   AbsoluteMouseReportSid = 3
};

template<>
struct ReportTraits<KeyboardReport>
{
   static constexpr int sid = KeyboardReportSid;
};

template<>
struct ReportTraits<MouseReport>
{
   static constexpr int sid = MouseReportSid;
};

template<>
struct ReportTraits<AbsoluteMouseReport>
{
   static constexpr int sid = AbsoluteMouseReportSid;
};


/// @brief An abstract simulator output stream.
///
class SimulatorStream_ {
   
   public:
      
      struct Endl {};
      
      SimulatorStream_(const Simulator *simulator) : simulator_(simulator) {}
      
      virtual ~SimulatorStream_() {}

   protected:
      
      std::ostream &getOStream() const;
      
      void checkLineStart();
      
      virtual void reactOnLineStart();
      virtual void reactOnLineEnd();
      
      template<typename _T>
      void output(const _T &t) {
         this->checkLineStart();
         this->getOStream() << t;
      }
      
      void output(const Endl &) {
         line_start_ = true;
         this->reactOnLineEnd();
         this->getOStream() << std::endl;
      }
      
   protected:
      
      const Simulator *simulator_;
      
   private:
      
      bool line_start_ = true;
};
   
/// @brief A stream class for error output.
///
class ErrorStream : public SimulatorStream_ {
   
   public:
      
      ErrorStream(const Simulator *simulator);
      
      template<typename _T>
      ErrorStream &operator<<(const _T &t) { 
         this->output(t);
         return *this; 
      }
      
      virtual ~ErrorStream() override;

   private:
   
      virtual void reactOnLineStart() override;
};

/// @brief A stream class for log output.
///
class LogStream : public SimulatorStream_ {
   
   public:
      
      LogStream(const Simulator *simulator);
      virtual ~LogStream() override;
      
      template<typename _T>
      LogStream &operator<<(const _T &t) { 
         this->output(t);
         return *this; 
      }
};

/// @brief A stream class that generates formatted text headers in log output.
///
class HeaderStream : public SimulatorStream_ {
   
   public:
      
      HeaderStream(const Simulator *simulator);
      
      template<typename _T>
      HeaderStream &operator<<(const _T &t) { 
         this->output(t);
         return *this; 
      }
      
      virtual ~HeaderStream() override;
      
   private:
   
      virtual void reactOnLineStart() override;
};

/// @brief A class that represents an individual test.
///
class Test {
   
   public:
      
      Test(Simulator *simulator, const char *name);
      ~Test();
      
   private:
      
      Simulator *simulator_;
      const char *name_;
      int error_count_start_;
};

        
/// @ brief The main test simulator object.
///
class Simulator {
   
   public:
      
      typedef int TimeType;
   
   private:
      
      std::ostream *out_;
      bool debug_;
      int cycle_duration_;
      bool abort_on_first_error_;
      
      bool assertions_passed_ = true;
   
      int cycle_id_ = 0;
      TimeType time_ = .0;
      int scan_cycles_default_count_ = 5;
      
      mutable int error_count_ = 0;
      
      bool error_if_report_without_queued_assertions_ = false;
      
      int n_typed_reports_in_cycle_[4] = {};
      int n_typed_overall_reports_[4] = {};
      
      int n_reports_in_cycle_ = 0;
      int n_overall_reports_ = 0;
      
      AssertionQueue<ReportAssertion_> queued_report_assertions_;
      
      AssertionQueue<ReportAssertion<KeyboardReport>> permanent_keyboard_report_assertions_;
      AssertionQueue<ReportAssertion<MouseReport>> permanent_mouse_report_assertions_;
      AssertionQueue<ReportAssertion<AbsoluteMouseReport>> permanent_absolute_mouse_report_assertions_;
      AssertionQueue<ReportAssertion_> permanent_generic_report_assertions_;
      
      AssertionQueue<Assertion_> queued_cycle_assertions_;
      AssertionQueue<Assertion_> permanent_cycle_assertions_;
      
      class HIDReportConsumer : public HIDReportConsumer_
      {
         public:
            
            HIDReportConsumer(Simulator &simulator) : simulator_(simulator) {}

            virtual void processHIDReport(uint8_t id, const void* data, 
                                    int len) override;
                           
         private:
            
            Simulator &simulator_;
            
      } hid_report_consumer_;
      
      friend class HIDReportConsumer;
      
   public:
      
      /// @brief Constructor.
      ///
      /// @param out The output stream that is used for all output.
      /// @param debug Generates additional debug information if enabled.
      /// @param cycle_duration The duration in ms of one scan cycle.
      /// @param abort_on_first_error If enabled, testing is aborted after
      ///        the first error occurred.
      ///
      Simulator(std::ostream &out, 
             bool debug, 
             int cycle_duration = 5, 
             bool abort_on_first_error = false);
      
      ~Simulator();
      
      /// @details If the ErrorIfReportWithoutQueuedAssertions is enabled
      ///          it is considered an error if no assertions are queued
      ///          for a report.
      /// @param state The new boolean state of the condition.
      ///
      void setErrorIfReportWithoutQueuedAssertions(bool state) {
         error_if_report_without_queued_assertions_ = state;
      }
      
      /// @brief Retreives the state of the ErrorIfReportWithoutQueuedAssertions
      ///        condition.
      /// @returns The conditions state.
      ///
      bool getErrorIfReportWithoutQueuedAssertions() const {
         return error_if_report_without_queued_assertions_;
      }
      
      AssertionQueue<ReportAssertion_> &queuedReportAssertions() {
         return queued_report_assertions_;
      }
      
      /// @brief Retreives the permanent keyboard report assertions.
      ///
      AssertionQueue<ReportAssertion<KeyboardReport>> &peramentKeyboardReportAssertions() {
         return permanent_keyboard_report_assertions_;
      }
      
      /// @brief Retreives the permanent mouse report assertions.
      ///
      AssertionQueue<ReportAssertion<MouseReport>> &permanentMouseReportAssertions() {
         return permanent_mouse_report_assertions_;
      }
      
      /// @brief Retreives the absolute mouse report assertions.
      ///
      AssertionQueue<ReportAssertion<AbsoluteMouseReport>> &permanentAbsoluteMouseReportAssertions() {
         return permanent_absolute_mouse_report_assertions_;
      }
      
      /// @brief Retreives the generic report assertions.
      ///
      AssertionQueue<ReportAssertion_> &permanentGenericReportAssertions() {
         return permanent_generic_report_assertions_;
      }
      
      /// @brief Retreives the queued cycle assertions.
      /// @details The head of the assertion queue is applied at the end of
      ///        the next cycle and removed afterwards.
      ///
      AssertionQueue<Assertion_> &queuedCycleAssertions() {
         return queued_cycle_assertions_;
      }
      
      /// @brief Retreives the permanent cycle assertions.
      /// @details Permanent cycle assertions are applied after every cycle.
      ///
      AssertionQueue<Assertion_> &permanentCycleAssertions() {
         return permanent_cycle_assertions_;
      }
      
      /// @brief Registers a key press event.
      ///
      /// @param row The keyboard matrix row.
      /// @param col The keyboard matrix col.
      ///
      void pressKey(uint8_t row, uint8_t col);
       
      /// @brief Registers a key release event. 
      ///
      /// @details Make sure that the key was registered
      ///          as pressed, using pressKey(...), before calling this method.
      ///
      /// @param row The keyboard matrix row.
      /// @param col The keyboard matrix col.
      ///
      void releaseKey(uint8_t row, uint8_t col);
      
      /// brief Registers a key being tapped.
      ///
      /// @param row The keyboard matrix row.
      /// @param col The keyboard matrix col.
      ///
      void tapKey(uint8_t row, uint8_t col);
      
      /// @brief Taps a key a number of times.
      ///
      /// @details After each tap, a specified number of cycles 
      ///          are processed automatically before the next tap is issued.
      ///
      /// @param num_taps The number of taps.
      /// @param row The keyboard matrix row.
      /// @param col The keyboard matrix col.
      /// @param tap_interval_cycles The number of cycles that are made 
      ///        elapsing between individual taps.
      ///
      void multiTapKey(int num_taps, uint8_t row, uint8_t col, 
                       int tap_interval_cycles = 1,
                       std::shared_ptr<Assertion_> after_tap_and_cycles_assertion = std::shared_ptr<Assertion_>()
                      );

      /// @brief Releases all keys that are currently pressed.
      ///
      void clearAllKeys();
         
      /// @brief Runs a scan cycle and processes assertions afterwards.
      ///
      void cycle();
         
      /// @brief Runs a number of scan cycles and processes assertions afterwards.
      ///
      /// @param n The number of cycles to run.
      /// @tparam assertions A list of assertions that are evaluated
      ///        after every cycle.
      ///
      template<typename..._Assertions>
      void cycles(int n = 0, _Assertions...assertions) {
         this->cyclesInternal(n,
            std::vector<std::shared_ptr<Assertion_>>{
               std::forward<_Assertions>(assertions)...
            }
         );
      }
      
      template<typename..._Assertions>
      void cycleExpectReports(_Assertions...assertions) {
         
         this->queuedReportAssertions()
            .add(std::forward<_Assertions>(assertions)...);
            
         this->cycle();
         
         if(!queued_report_assertions_.empty()) {
            this->error() << "Keyboard report assertions are left in queue";
         }
      }
            
      /// @brief Skips a given amount of time by running cycles.
      ///
      /// @param delta_t A time interval in [ms] that is supposed to be skipped.
      ///
      void advanceTimeBy(TimeType delta_t);
      
      /// @brief Runs keyboard scan cycles until a specified point in time.
      ///
      /// @param time The target time in [ms].
      ///
      void advanceTimeTo(TimeType time);
      
      /// @brief Immediately evaluates a number of assertions
      ///
      /// @tparam assertions A number assertions to be evaluated immediately.
      ///
      template<typename..._Assertions>
      void evaluateAssertions(_Assertions...assertions) {
         this->evaluateAssertionsInternal(
            std::vector<std::shared_ptr<Assertion_>>{
               std::forward<_Assertions>(assertions)...
            }
         );
      }
            
      /// @brief Retreives a stream object for log output.
      ///
      /// @returns The log stream object.
      /// 
      LogStream log() const { return LogStream{this}; }
      
      /// @brief Retreives a log stream for header output.
      ///
      /// @returns The header log stream object.
      /// 
      HeaderStream header() const { return HeaderStream{this}; }
         
      /// @brief Retrieves a log stream for error output.
      ///
      /// @returns The error log stream object.
      ///
      ErrorStream error() const { 
         ++error_count_;
         return ErrorStream{this}; 
      }
      
      /// @brief Retreives the total number of errors that were registered.
      ///
      int getErrorCount() const { return error_count_; }
      
      /// @brief Resets the keyboard to initial state.
      ///
      void initKeyboard();
      
      /// @brief Retreives the state of the AbortOnFirstError condition.
      ///
      bool getAbortOnFirstError() const { return abort_on_first_error_; }
      
      /// @brief Retreives the current time [ms].
      ///
      TimeType getTime() const { return time_; }
      
      /// @brief Sets time.
      /// 
      /// @param time The new value for time in [ms].
      ///
      void setTime(TimeType time) { time_ = time; }
      
      /// @brief Retreives the current cycle id.
      ///
      int getCycleId() const { return cycle_id_; }
      
      /// @brief Sets debugging output state. If enabled, additional (verbose)
      ///        output is generated.
      ///
      /// @param state The new state of debugging output.
      ///
      void setDebug(bool state) { debug_ = state; }
      
      /// @brief Retreives the current debugging state.
      ///
      bool getDebug() const { return debug_; }
      
      /// @brief Asserts that no assertions (keyboard report and cycle)
      ///        are currently queued.
      /// @details This function is automatically called at the end of each 
      ///        test to make sure that all assertions were used.
      ///
      void assertNothingQueued() const;
      
      /// @brief Generates a test.
      /// @details The lifetime of the returned test object decides about
      ///        the duration of a test.
      /// @returns The test object. Add additonal scope if necessary to 
      ///        restrict the lifetime of test objects.
      ///
      Test newTest(const char *name) {
         return Test{this, name};
      }
      
      /// @brief Asserts a boolean condition.
      /// @param cond The condition.
      /// @param assertion_code A string representation of the assertion.
      ///
      void assertCondition(bool cond, const char *condition_string) const;
      
      /// @brief Changes the duration in [ms] of every simulated cycle.
      /// @param dt The new duration [ms].
      ///
      void setCycleDuration(TimeType dt) {
         cycle_duration_ = dt;
      }
      
      /// @brief Retreives the currently defined cycle duration.
      /// @returns The cycle duration in [ms].
      ///
      TimeType getCycleDuration() const {
         return cycle_duration_;
      }
      
      /// @brief Resets the simulator output stream.
      /// @details This might serve to redirect output to a file
      ///        by using a std::ofstream.
      /// @param out The new ostream object.
      ///
      void setOStream(std::ostream &out) {
         out_ = &out;
      }
      
      /// @brief Retreives the currently associated ostream object.
      ///
      std::ostream &getOStream() const { return *out_; }
      
      /// @brief Runs the simulator for a given amount of time.
      /// @details The simulation runs in real time, i.e. if necessary
      ///        the simulator waits for a given amount of time in each
      ///        cycle to make sure that the simulation runs in exactly
      ///        the same speed as it would run on the device.
      ///        A provided function is executed in every cycle.
      ///
      /// @param duration The duration of the run. If duration is zero,
      ///        the simulation runs forever.
      /// @param cycle_function A function that is executed after every cycle.
      ///
      void runRealtime(TimeType duration, const std::function<void()> &cycle_function);
      
      /// @brief Runs the simulator in a continuous loop an reacts on stdin.
      /// @details Key state information is read from stdin in each loop cycle.
      ///
      /// @param cycle_function A function that is executed after every cycle.
      ///
      void runRemoteControlled(const std::function<void()> &cycle_function);
      
      int getNumReportsInCycle() const { return n_typed_reports_in_cycle_[AnyTypeReportSid]; }
      int getNumOverallReports() const { return n_typed_overall_reports_[AnyTypeReportSid]; }
      
      int getNumKeyboardReportsInCycle() const { return n_typed_reports_in_cycle_[KeyboardReportSid]; }
      int getNumOverallKeyboardReports() const { return n_typed_overall_reports_[KeyboardReportSid]; }
      
      int getNumMouseReportsInCycle() const { return n_typed_reports_in_cycle_[MouseReportSid]; }
      int getNumOverallMouseReports() const { return n_typed_overall_reports_[MouseReportSid]; }
      
      int getNumAbsoluteMouseReportsInCycle() const { return n_typed_reports_in_cycle_[AbsoluteMouseReportSid]; }
      int getNumOverallAbsoluteMouseReports() const { return n_typed_overall_reports_[AbsoluteMouseReportSid]; }
      
      template<typename _ReportType>
      int getNumTypedReportsInCycle() const {
         return n_typed_reports_in_cycle_[ReportTraits<_ReportType>::sid];
      }
      
      template<typename _ReportType>
      int getNumTypedOverallReports() const {
         return n_typed_overall_reports_[ReportTraits<_ReportType>::sid];
      }
      
   private:
      
      bool checkStatus() const;
            
      void headerText();
      
      void footerText();
                 
      void cycleInternal(bool only_log_reports = false);
      
      void checkCycleDurationSet();
      
      AssertionQueue<ReportAssertion<KeyboardReport>> &getPermanentReportAssertions(Type2Type<KeyboardReport>) {
         return permanent_keyboard_report_assertions_;
      }
      
      AssertionQueue<ReportAssertion<MouseReport>> &getPermanentReportAssertions(Type2Type<MouseReport>) {
         return permanent_mouse_report_assertions_;
      }
      
      AssertionQueue<ReportAssertion<AbsoluteMouseReport>> &getPermanentReportAssertions(Type2Type<AbsoluteMouseReport>) {
         return permanent_absolute_mouse_report_assertions_;
      }
      
      // This method is templated to enable it being used for std::vector
      // and std::deque.
      //
      template<typename _Container>
      void evaluateAssertionsInternal(const _Container &assertions) {
            
         if(assertions.empty()) { return; }
         
         for(auto &assertion: assertions) {
      
            // Just in case we haven't done that before
            //
            assertion->setSimulator(this);
            
            bool assertion_passed = assertion->eval();
            
            if(!assertion_passed || debug_) {
               assertion->report();
            }
            
            assertions_passed_ &= assertion_passed;
         }
      }
      
      void processReportAssertion(ReportAssertion_ &assertion, 
                                  const Report_ &report) {
         
         assertion.setReport(&report);
         
         bool assertion_passed = assertion.eval();
         
         if(!assertion_passed || debug_) {
            assertion.report();
         }
         
         assertions_passed_ &= assertion_passed;
         assertion.setReport(nullptr);
      }
      
      template<typename _ReportType>
      void processReport(const _ReportType &report) {
         
         ++n_typed_overall_reports_[AnyTypeReportSid];
         ++n_typed_reports_in_cycle_[AnyTypeReportSid];
         
         static constexpr int sid = ReportTraits<_ReportType>::sid;
         
         ++n_typed_overall_reports_[sid];
         ++n_typed_reports_in_cycle_[sid];
         
         this->log() << "Processing " << _ReportType::typeString() << " report "
               << n_typed_overall_reports_[AnyTypeReportSid]
               << " (" << n_typed_reports_in_cycle_[AnyTypeReportSid] << ". in cycle "
               << this->getCycleId() << ")";
                        
         auto n_assertions_queued = queued_report_assertions_.size();
         
         this->log() << n_assertions_queued
            << " queued " << _ReportType::typeString() << " report assertions";
         
         if(!queued_report_assertions_.empty()) {
            auto assertion = queued_report_assertions_.popFront();
            
            auto report_type = assertion->getReportTypeId();
            
            if(report_type == Report_::hid_report_type_) {
               // Generic report
               //
               this->processReportAssertion(*assertion, report);
            }
            else if(report_type == _ReportType::hid_report_type_) {
               auto &typed_assertion = static_cast<ReportAssertion<_ReportType>&>(*assertion);
               this->processReportAssertion(typed_assertion, report);
            }
            else {
               this->error() << "Expected a "
                  << assertion->getTypeString() << " assertion but encountered a "
                  << _ReportType::typeString() << " assertion";
            }
         }
         
         auto &permanent_assertions = this->getPermanentReportAssertions(Type2Type<_ReportType>{});
         for(auto &assertion: permanent_assertions.directAccess()) {
            this->processReportAssertion(*assertion, report);
         }

         for(auto &assertion: permanent_generic_report_assertions_.directAccess()) {
            this->processReportAssertion(*assertion, report);
         }
               
         if((n_assertions_queued == 0) && this->getErrorIfReportWithoutQueuedAssertions()) {
            this->error() << "Encountered a " << _ReportType::typeString() << " report without assertions being queued";
         }
      }
      
      std::string generateCycleInfo() const;
      
      void skipTimeInternal(TimeType delta_t);
      
      void cyclesInternal(int n, 
                  const std::vector<std::shared_ptr<Assertion_>> &cycle_assertion_list);
};

/// @brief Asserts a condition.
/// @details Use this macro instead of the Simulator class' assertCondition(...)
///        method to enable string output of the condition code in
///        error messages.
///
#define KT_ASSERT_CONDITION(DRIVER, ...)                                       \
   DRIVER.assertCondition((__VA_ARGS__), #__VA_ARGS__)
      
} // namespace simulator
} // namespace kaleidoscope
