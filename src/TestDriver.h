/* -*- mode: c++ -*-
 * Kaleidoscope-Testing -- A C++ testing API for the Kaleidoscope keyboard 
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

#include <vector>

namespace kaleidoscope {
namespace testing {
   
class Driver;
   
class ErrorStream {
   
   public:
      
      ErrorStream(Driver *driver, bool abort_after_output);
      
      template<typename _T>
      ErrorStream &operator<<(const _T &t) { driver.getOStream() << t; return *this; }
      
      ~ErrorStream();
      
   private:
      
      Driver *driver_;
};

class LogStream {
   
   public:
      
      LogStream(Driver *driver);
      
      template<typename _T>
      LogStream &operator<<(const _T &t) { driver.getOStream() << t; return *this; }
      
      ~LogStream();
      
   private:
      
      Driver *driver_;
};

class HeaderStream {
   
   public:
      
      HeaderStream(Driver *driver);
      
      template<typename _T>
      HeaderStream &operator<<(const _T &t) { driver.getOStream() << t; return *this; }
      
      ~HeaderStream();
      
   private:
      
      Driver *driver_;
};
        
/** class Driver
 *  brief The main test driver object.
 */
class Driver {
   
   private:
      
      std::ostream &out_;
      bool debug_;
      int cycle_duration_;
      bool abort_on_first_error_;
      
      bool assertions_passed_ = true;
      int n_keyboard_reports_in_cycle_ = 0;
      int n_overall_keyboard_reports_ = 0;
   
      int cycle_id_ = 0;
      double time_ = .0;
      int scan_cycles_default_count_ = 5;
      
      bool error_if_report_without_queued_assertions_ = false;
      
      AssertionQueue queued_keyboard_report_assertions_;
      AssertionQueue permanent_keyboard_report_assertions_;
      AssertionQueue queued_cycle_assertions_;
      AssertionQueue permanent_cycle_assertions_;
      
   public:
      
      /** brief The driver constructor.
       *
       * param out The output stream that is used for all output.
       * param debug Generates additional debug information if enabled.
       * param cycle_duration The duration in ms of one scan cycle.
       * param no_exit
       * 
       * 
       * return void
       */
      Driver(std::ostream &out, 
             bool debug, 
             int cycle_duration = 5, 
             bool abort_on_first_error = false);
      
      ~Driver();
      
      void setErrorIfReportWithoutQueuedAssertions(bool state) {
         error_if_report_without_queued_assertions_ = state;
      }
      
      bool getErrorIfReportWithoutQueuedAssertions() const {
         return error_if_report_without_queued_assertions_;
      }
      
      AssertionQueue &getQueuedKeyboardReportAssertions() {
         return queued_keyboard_report_assertions_;
      }
      
      AssertionQueue &getPermanentKeyboardReportAssertions() {
         return permanent_keyboard_report_assertions_;
      }
      
      AssertionQueue &getQueuedCycleAssertions() {
         return queued_cycle_assertions_;
      }
      
      AssertionQueue &getPermanentCycleAssertions() {
         return permanent_cycle_assertions_;
      }

      // Some wrapper functions for kaleidoscope stuff
      
      /** brief Registers a key down event.
       *
       * param row The keyboard key row.
       * param col The keyboard key col.
       * 
       * return void
       */ 
      void keyDown(uint8_t row, uint8_t col);
       
      /** brief Registers a key up event. 
       * 
       * details Make sure that the key was registered
       *         as active before, using keyDown(...).
       *
       * param row The keyboard key row.
       * param col The keyboard key col.
       * 
       * return void
       */ 
      void keyUp(uint8_t row, uint8_t col);
      
      /** brief Registers tap of a key.
       *
       * param row The keyboard key row.
       * param col The keyboard key col.
       * 
       * return void
       */ 
      void tap(uint8_t row, uint8_t col);

      /** brief Clears all keys that are currently active (down).
       * 
       * return void
       */ 
      void clearAllKeys();
         
      /** brief Executes a scan cycle and processes assertions afterwards.
       * 
       * param on_stop_assertion_list A list of assertions to be executed after
               the next cycle and to be discarded afterwards. Defaults to None.
       * 
       * return void
       */ 
      void scanCycle(std::vector<std::shared_ptr<_Assertion>> 
               &on_stop_assertion_list = std::vector<std::shared_ptr<_Assertion>>{});
         
      /** brief Executes a number of scan cycles and processes assertions afterwards.
       * 
       * param n The number of cycles to execute.
       * param on_stop_assertion_list A list of assertions to be executed after
               the cycles where executed and to be discarded afterwards. Defaults
               to None.
         param cycle_assertion_list A list of assertions that are executed
               after every cycle.
       * 
       * return void
       */ 
      void scanCycles(int n = 0, 
                      std::vector<std::shared_ptr<_Assertion>> 
                           &on_stop_assertion_list = std::vector<std::shared_ptr<_Assertion>>{}, 
                      std::vector<std::shared_ptr<_Assertion>> 
                           &cycle_assertion_list = std::vector<std::shared_ptr<_Assertion>>{});
            
      /** brief Skips a given amount of time by executing cycles and processes assertions afterwards.
       * 
       * details Important:
            Make sure to set the cycle_duration_ property of the TestDriver class 
            to a non zero value in [ms] before calling this method.
       * 
       * param delta_t A time in [ms] that is supposed to be skipped.
       * param on_stop_assertion_list A list of assertions to be executed after
               the cycles where executed and to be discarded afterwards. Defaults
               to none.
       * 
       * return void
       */ 
      void skipTime(double delta_t, 
                    std::vector<std::shared_ptr<_Assertion>> 
                           &on_stop_assertion_list = std::vector<std::shared_ptr<_Assertion>>{});
            
     /** brief Retreives a log stream.
      * 
       * return A log stream object.
       */ 
      LogStream log() { return LogStream{this}; }
      
//       void rawLog(msg) {
//          """ Writes a log message without time information.
//          
//          Args:
//             msg (string) { The log message.
//          """
//          out_ << "%s\n" % msg, outputTime = false)
//          
//       void description(msg) {
//          """ Writes a description message without time information.
//          
//          Args:
//             msg (string) { The description message.
//          """
//          out_ << "%s" % msg, outputTime = false)
      
      /** brief Retreives a header log stream.
      * 
       * return A header stream object.
       */ 
      HeaderStream header() { return HeaderStream{this}; }
         
      ErrorStream error() { return ErrorStream{this}; }
      
//       void graphicalMap(self) {
//          import GraphicalMap
//          GraphicalMap.graphicalMap(this->out, this->hardware)
         
      /** brief Resets the keyboard to initial state.
      * 
       * return void.
       */ 
      void initKeyboard();
         
      const KeyboardReport &getCurrentKeyboardReport() const {
         return current_keyboard_report_;
      }
         
      std::ostream &getOStream() { return out_; }  
      
      bool getAbortOnFirstError() const { return abort_on_first_error_; }
      
   private:
      
      bool checkStatus() const;
            
      void headerText();
      
      void footerText();
      
      void processKeyboardReport(const KeyboardReport &keyboard_report);
            
      void processKeyboardReportAssertion(std::shared_ptr<_Assertion> &assertion, 
                                  const KeyboardReport &keyboard_report);
         
      void configureTemporaryAssertion(std::shared_ptr<_Assertion> &assertion);
                 
      void scanCycle(std::vector<std::shared_ptr<_Assertion>> 
               &on_stop_assertion_list = std::vector<std::shared_ptr<_Assertion>>{}, 
               only_log_reports = false);
      
      void checkCycleDurationSet();
      
      template<typename _Container>
      void processCycleAssertions(_Containter &assertions) {
            
         if(assertions.empty()) { return; }
         
         for(auto &assertion: assertions) {
            
            bool assertion_passed = assertion->eval(self);
            
            if(!assertion_passed || debug_) {
               assertion->report(out_);
            }
            
            assertions_passed_ &= assertion_passed;
         }
      }
      
   private:
      
      KeyboardReport current_keyboard_report_;
};
      
} // namespace testing
} // namespace kaleidoscope
