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
   this->DriverStream_::reactOnLineStart();
   out << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Error !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
}
      
ErrorStream::~ErrorStream() {
   
   this->getOStream() << "\n";
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
   
   if(driver_->getAbortOnFirstError()) {
      exit(1);
   }
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
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "########################################################\n";
}

HeaderStream::~HeaderStream() {
   this->getOStream() << "\n";
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "########################################################\n";
}

void HeaderStream::reactOnLineStart()
{
   this->DriverStream_::reactOnLineStart();
   this->getOStream() << "### ";
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

   :  out_{out},
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

void Driver::keyDown(uint8_t row, uint8_t col) {
   this->log() << "+ Activating key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::PRESSED);
}

void Driver::keyUp(uint8_t row, uint8_t col) {
   this->log() << "+ Releasing key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
}

void Driver::tapKey(uint8_t row, uint8_t col) {
   this->log() << "+- Tapping key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::TAP);
}
 
void Driver::clearAllKeys() {
   this->log() << "- Clearing all keys";
   
   for(byte row = 0; row < KeyboardHardware.matrix_rows; row++) {
      for(byte col = 0; col < KeyboardHardware.matrix_columns; col++) {
         KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
      }
   }
}

void Driver::cycle(const std::vector<std::shared_ptr<_Assertion>> 
         &on_stop_assertion_list) {
   this->log() << "Running single scan cycle";
   this->cycleInternal(on_stop_assertion_list, true);
   this->log() << "";
}

void Driver::cycles(int n, 
                  const std::vector<std::shared_ptr<_Assertion>> &on_stop_assertion_list , 
                  const std::vector<std::shared_ptr<_Assertion>> &cycle_assertion_list) {
   if(n == 0) {
      n = scan_cycles_default_count_;
   }
   
   this->log() << "Running " << n << " scan cycles";
   
   if(!on_stop_assertion_list.empty()) {
      for(auto &assertion: on_stop_assertion_list) {
         assertion->setDriver(this);
      }
   }
         
   for(int i = 0; i < n; ++i) { 
      this->cycleInternal(cycle_assertion_list, true /* on_log_reports */);
   }
      
   if(!on_stop_assertion_list.empty()) {
      this->log() << "Processing " << on_stop_assertion_list.size()
         << " cycle assertions on stop";
      this->processCycleAssertions(on_stop_assertion_list);
   }
      
   this->log() << "";
}

void Driver::skipTime(Driver::TimeType delta_t, 
               const std::vector<std::shared_ptr<_Assertion>> &on_stop_assertion_list) {
   
   this->checkCycleDurationSet();
   
   auto start_cycle = cycle_id_;
   
   this->log() << "Skipping dt >= " << delta_t << " ms";
         
   if(!on_stop_assertion_list.empty()) {
      for(auto &assertion: on_stop_assertion_list) {
         assertion->setDriver(this);
      }
   }
         
   auto start_time = time_;
   
   Driver::TimeType elapsed_time = 0;
   while(elapsed_time < delta_t) {
      this->cycleInternal(std::vector<std::shared_ptr<_Assertion>>{} /*dummy*/,
                      true /* only_log_reports */);
      elapsed_time = time_ - start_time;
   }
      
   this->log() << elapsed_time << " ms (" << cycle_id_ << " cycles) skipped";
      
   if(!on_stop_assertion_list.empty()) { 
      this->log() << "Processing " << on_stop_assertion_list.size() 
         << " cycle assertions on stop";
      this->processCycleAssertions(on_stop_assertion_list);
   }
      
   this->log() << "";
}

void Driver::initKeyboard() {
   this->clearAllKeys();
   kaleidoscope::hid::initializeKeyboard();
}

bool Driver::checkStatus() const {
   
   bool success = true;
   
   if(!queued_keyboard_report_assertions_.empty()) {
      this->error() << "There are " << queued_keyboard_report_assertions_.size()
         << " left over assertions in the queue";
      success = false;
   }
   
   if(!assertions_passed_) {
      this->error() << "Not all assertions passed";
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
   this->log() << "";
   this->log() << "################################################################################";
   this->log() << "";
   this->log() << "Kaleidoscope-Testing";
   this->log() << "";
   this->log() << "author: noseglasses (https://github.com/noseglasses, shinynoseglasses@gmail.com)";
   this->log() << "";
   this->log() << "cycle duration: " << cycle_duration_ << "";
   this->log() << "################################################################################";
   this->log() << "";
}

void Driver::footerText() {
   this->log() << "";
   this->log() << "################################################################################";
   this->log() << "Testing done";
   this->log() << "################################################################################";
   this->log() << "";
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
            
void Driver::cycleInternal(const std::vector<std::shared_ptr<_Assertion>> &on_stop_assertion_list, 
                       bool only_log_reports) {
   
   ++cycle_id_;
   n_keyboard_reports_in_cycle_ = 0;
   
   if(!only_log_reports) {
      this->log() << "Scan cycle " << cycle_id_;
   }
   
   if(on_stop_assertion_list.empty()) {
      for(auto &assertion: on_stop_assertion_list) {
         assertion->setDriver(this);
      }
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
   
   if(!on_stop_assertion_list.empty()) {
      this->log() << "Processing " << on_stop_assertion_list.size()
         << " cycle assertions on stop";
      this->processCycleAssertions(on_stop_assertion_list);
   }
   
   if(!queued_cycle_assertions_.empty()) {
      this->log() << "Processing " << queued_cycle_assertions_.size()
         << " queued cycle assertions";
      this->processCycleAssertions(queued_cycle_assertions_.directAccess());
      
      queued_cycle_assertions_.clear();
   }
   
   if(!permanent_cycle_assertions_.empty()) {
      this->log() << "Processing " << permanent_cycle_assertions_.size()
         << " permanent cycle assertions";
      
      this->processCycleAssertions(permanent_cycle_assertions_.directAccess());
   }
}

void Driver::checkCycleDurationSet() {
   if(cycle_duration_ == 0) {
      this->error() << "Please set test.cycle_duration_ to a value in "
         "[ms] greater zero before using time based testing";
   }
}
      
} // namespace testing
} // namespace kaleidoscope
