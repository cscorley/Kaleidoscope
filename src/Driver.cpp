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

#include "Driver.h"
#include "assertions/_Assertion.h"

#include "Kaleidoscope.h"
#include "kaleidoscope/hid.h"
#include "MultiReport/Keyboard.h"

#include <iostream>
#include <iomanip>

namespace kaleidoscope {
namespace testing {

std::ostream &DriverStream_::getOStream() const
{
   return driver_->getOStream();
}

void DriverStream_::checkLineStart() {
   
   if(!line_start_) { return; }
   
   line_start_ = false;
   
   this->reactOnLineStart();
}

void DriverStream_::reactOnLineStart()
{
   this->getOStream() << "t=" << /*std::fixed << std::setw(4) << */driver_->getTime() 
                      << ", c=" << /*std::fixed << std::setw(4) << */driver_->getCycleId()
                      << ": ";
}

void DriverStream_::reactOnLineEnd() 
{
   this->getOStream() << "\n";
}
   
ErrorStream::ErrorStream(const Driver *driver) 
   :  DriverStream_(driver)
{
   auto &out = this->getOStream();
   
   // Foreground color red
   //
   out << "\x1B[31;1m";
   
   this->DriverStream_::reactOnLineStart();
   out << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Error !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
}
      
ErrorStream::~ErrorStream() {
   
   this->getOStream() << "\n";
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
   
   if(driver_->getAbortOnFirstError()) {
      this->DriverStream_::reactOnLineStart();
      this->getOStream() << "Bailing out.";
      exit(1);
   }
   
   // Restore color to neutral.
   //
   this->getOStream() << "\x1B[0m";
}

void ErrorStream::reactOnLineStart()
{
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "!!! ";
}

LogStream::LogStream(const Driver *driver) 
   :  DriverStream_(driver)
{
}

LogStream::~LogStream() {
   this->getOStream() << "\n";
}

HeaderStream::HeaderStream(const Driver *driver) 
   :  DriverStream_(driver)
{  
   // Foreground color red
   //
   this->getOStream() << "\x1B[32;1m";
   
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "########################################################\n";
}

HeaderStream::~HeaderStream() {
   this->getOStream() << "\n";
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "########################################################\n";
   
   // Restore color to neutral.
   //
   this->getOStream() << "\x1B[0m";
}

void HeaderStream::reactOnLineStart()
{
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "### ";
}

Test::Test(Driver *driver, const char *name) 
   :  driver_(driver),
      name_(name),
      error_count_start_(driver->getErrorCount())
{
   driver->header() << "Test " << name;
}

Test::~Test() {
   driver_->assertNothingQueued();
   
   auto error_count_end = driver_->getErrorCount();
   
   if(error_count_start_ != error_count_end) {
      driver_->error() << "Test " << name_ << " failed";
   }
}

void Driver::KeyboardReportConsumer::processKeyboardReport(
                           const HID_KeyboardReport_Data_t &report_data)
{
   driver_.processKeyboardReport(report_data);
}

Driver::Driver(std::ostream &out, 
         bool debug, 
         int cycle_duration, 
         bool abort_on_first_error)

   :  out_{&out},
      debug_{debug},
      cycle_duration_{cycle_duration}, // ms
      abort_on_first_error_{abort_on_first_error},
      
      queued_keyboard_report_assertions_{*this, "queued keyboard report"},
      permanent_keyboard_report_assertions_{*this, "permanent keyboard report"},
      queued_cycle_assertions_{*this, "queued cycle"},
      permanent_cycle_assertions_{*this, "permanent cycle"},
      
      keyboard_report_consumer_{*this}
{
   KeyboardHardware.setEnableReadMatrix(false);

   Keyboard.setKeyboardReportConsumer(keyboard_report_consumer_);

   this->headerText();
}

Driver::~Driver() {
   this->footerText();
   
   if(!this->checkStatus()) {
      this->error() << "Terminating with exit code 1";
      exit(1);
   }
}

using namespace kaleidoscope::hardware;

void Driver::pressKey(uint8_t row, uint8_t col) {
   this->log() << "+ Activating key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::PRESSED);
}

void Driver::releaseKey(uint8_t row, uint8_t col) {
   this->log() << "+ Releasing key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
}

void Driver::tapKey(uint8_t row, uint8_t col) {
   this->log() << "+- Tapping key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::TAP);
}

void Driver::multiTapKey(int num_taps, uint8_t row, uint8_t col, 
                         int tap_interval_cycles,
                         std::shared_ptr<_Assertion> after_tap_and_cycles_assertion) {
   if(after_tap_and_cycles_assertion) {
      after_tap_and_cycles_assertion->setDriver(this);
   }
   
   this->log() << "+- Tapping key (" << (unsigned)row << ", " << (unsigned)col << ") " 
            << num_taps << " times";
   for(int i = 0; i < num_taps; ++i) {
      
      // Do the tap
      //
      KeyboardHardware.setKeystate(row, col, Virtual::TAP);
      
      // Run a user-defined number of cycles
      //
      for(int c = 0; c < tap_interval_cycles; ++c) {
         this->cycleInternal(true /* only log reports */);
      }
      
      // Check and execute the assertion
      //
      if(after_tap_and_cycles_assertion) {
         this->log() << "Checking assertion after tap " << i;
         if(!after_tap_and_cycles_assertion->eval()) {
            this->error() << "Assertion after tap " << i << " failed";
            after_tap_and_cycles_assertion->report();
         }
      }
   }
}
 
void Driver::clearAllKeys() {
   this->log() << "- Clearing all keys";
   
   for(byte row = 0; row < KeyboardHardware.matrix_rows; row++) {
      for(byte col = 0; col < KeyboardHardware.matrix_columns; col++) {
         KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
      }
   }
}

void Driver::cycle() {
   this->log() << "Running single scan cycle";
   this->cycleInternal(true);
   this->log() << "";
}

void Driver::cyclesInternal(int n, 
                  const std::vector<std::shared_ptr<_Assertion>> &cycle_assertion_list) {
   if(n == 0) {
      n = scan_cycles_default_count_;
   }
   
   this->log() << "Running " << n << " scan cycles";
         
   for(int i = 0; i < n; ++i) { 
      this->cycleInternal(true /* on_log_reports */);
      this->evaluateAssertionsInternal(cycle_assertion_list);
   }
      
   this->log() << "";
}

void Driver::advanceTime(Driver::TimeType delta_t) {
   
   this->checkCycleDurationSet();
   
   this->log() << "Skipping dt >= " << delta_t << " ms";
   
   this->skipTimeInternal(delta_t);
}

void Driver::skipTimeInternal(Driver::TimeType delta_t) {
   
   auto start_cycle = cycle_id_;
         
   auto start_time = time_;
   
   Driver::TimeType elapsed_time = 0;
   while(elapsed_time < delta_t) {
      this->cycleInternal(true /* only_log_reports */);
      elapsed_time = time_ - start_time;
   }
      
   this->log() << elapsed_time << " ms (" << (cycle_id_ - start_cycle) << " cycles) skipped";
      
   this->log() << "";
}

void Driver::cycleTo(TimeType time)
{
   if(time <= time_) {
      this->error() << "Failed cycling to time " << time << " ms. Target time is in the past.";
      return;
   }
   
   this->log() << "Cycling to t = " << time << " ms";
   
   TimeType delta_t = time - time_;
   
   this->skipTimeInternal(delta_t);
}

void Driver::initKeyboard() {
   this->clearAllKeys();
   kaleidoscope::hid::initializeKeyboard();
}

bool Driver::checkStatus() const {
   
   bool success = true;
   
   if(!queued_keyboard_report_assertions_.empty()) {
      this->error() << "There are " << queued_keyboard_report_assertions_.size()
         << " left over assertions in the queue.";
      success = false;
   }
   
   if(!assertions_passed_) {
      this->error() << "Not all assertions passed.";
      success = false;
   }
   
   if(error_count_ != 0) {
      success = false;
   }
      
   if(success) {
      this->log() << "All tests passed.";
      return true;
   }
   else {
      this->error() << "Errors occurred.";
   }
   
   return false;
}
      
void Driver::headerText() {
   
   // Foreground color red
   //
   this->getOStream() << "\x1B[33;1m";
   
   this->log() << "";
   this->log() << "################################################################################";
   this->log() << "";
   this->log() << "Kaleidoscope-Testing";
   this->log() << "";
   this->log() << "author: noseglasses (https://github.com/noseglasses, shinynoseglasses@gmail.com)";
   this->log() << "";
   this->log() << "cycle duration: " << cycle_duration_ << " ms";
   this->log() << "debug: " << std::boolalpha << debug_;
   this->log() << "aborting on first error: " << abort_on_first_error_;
   this->log() << "################################################################################";
   this->log() << "";
   
   // Restore color to neutral.
   //
   //this->getOStream() << "\x1B[0m";
   this->getOStream() << "\x1B[0m";
}

void Driver::footerText() {
   
   // Foreground color red
   //
   this->getOStream() << "\x1B[33;1m";
   
   this->log() << "";
   this->log() << "################################################################################";
   this->log() << "Testing done";
   this->log() << "";
   this->log() << "duration: " << time_ << " ms = " << cycle_id_ << " cycles";
   this->log() << "error_count: " << error_count_;
   this->log() << "";
   this->log() << "num. keyboard reports processed: " << n_overall_keyboard_reports_;
   this->log() << "################################################################################";
   this->log() << "";
   
   // Restore color to neutral.
   //
   //this->getOStream() << "\x1B[0m";
   this->getOStream() << "\x1B[0m";
}

void Driver::processKeyboardReport(const HID_KeyboardReport_Data_t &report_data) {
   
   current_keyboard_report_.setReportData(report_data);
   
   ++n_overall_keyboard_reports_;
   ++n_keyboard_reports_in_cycle_;
   
   this->log() << "Processing keyboard report "
         << n_overall_keyboard_reports_
         << " (" << n_keyboard_reports_in_cycle_ << ". in cycle "
         << cycle_id_ << ")";
                  
   auto n_assertions_queued = queued_keyboard_report_assertions_.size();
   
   this->log() << n_assertions_queued
      << " queued report assertions";
   
   if(!queued_keyboard_report_assertions_.empty()) {
      this->processKeyboardReportAssertion(queued_keyboard_report_assertions_.popFront());
   }
      
   if(!permanent_keyboard_report_assertions_.empty()) {
      
      this->log() << permanent_keyboard_report_assertions_.size()
         << " permanent report assertions";
      
      for(auto &assertion: permanent_keyboard_report_assertions_.directAccess()) {
         this->processKeyboardReportAssertion(assertion);
      }
   }
         
   if((n_assertions_queued == 0) && error_if_report_without_queued_assertions_) {
      this->error() << "Encountered a report without assertions being queued";
   }
}
      
void Driver::processKeyboardReportAssertion(const std::shared_ptr<_Assertion> &assertion) {
   
   bool assertion_passed = assertion->eval();
   
   if(!assertion_passed || debug_) {
      assertion->report();
   }
   
   assertions_passed_ &= assertion_passed;
}
            
void Driver::cycleInternal(bool only_log_reports) {
   
   ++cycle_id_;
   n_keyboard_reports_in_cycle_ = 0;
   
   if(!only_log_reports) {
      this->log() << "Scan cycle " << cycle_id_;
   }

   ::loop();
   
   if(n_keyboard_reports_in_cycle_ == 0) {
      if(!only_log_reports) {
         this->log() << "No keyboard reports processed";
      }
   }
   else {
      this->log() << n_keyboard_reports_in_cycle_ << " keyboard reports processed";
   }
   
   time_ += cycle_duration_;
   
   //kaleidoscope.setMillis(time_)
   
   if(!queued_cycle_assertions_.empty()) {
      this->log() << "Processing " << queued_cycle_assertions_.size()
         << " queued cycle assertions";
      this->evaluateAssertionsInternal(queued_cycle_assertions_.directAccess());
      
      queued_cycle_assertions_.clear();
   }
   
   if(!permanent_cycle_assertions_.empty()) {
      this->log() << "Processing " << permanent_cycle_assertions_.size()
         << " permanent cycle assertions";
      
      this->evaluateAssertionsInternal(permanent_cycle_assertions_.directAccess());
   }
}

void Driver::checkCycleDurationSet() {
   if(cycle_duration_ == 0) {
      this->error() << "Please set test.cycle_duration_ to a value in "
         "[ms] greater zero before using time based testing";
   }
}

void Driver::assertNothingQueued() const
{
   if(!queued_keyboard_report_assertions_.empty()) {
      this->error() << "Keyboard report assertions are left in queue";
   }
   
   if(!queued_cycle_assertions_.empty()) {
      this->error() << "Cycle assertions are left in queue";
   }
}

void Driver::assertCondition(bool cond, const char *assertion_code) const
{
   if(!cond) {
      this->error() << "Assertion failed: " << assertion_code;
   }
}
      
} // namespace testing
} // namespace kaleidoscope
