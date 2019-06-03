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

#include "TestDriver.h"

namespace kaleidoscope {
namespace testing {
   
ErrorStream::ErrorStream(Driver *driver, bool abort_after_output) 
   :  driver_(driver),
      abort_after_output_(abort_after_output)
{
   auto &out = driver.getOStream();
   out << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
   out << "Error:\n";
   out << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
}
      
ErrorStream::~ErrorStream() {
   driver.getOStream() << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
   
   if(driver_->getAbortOnFirstError()) {
      exit(1);
   }
}

LogStream::LogStream(Driver *driver) 
   :  driver_(driver)
{
   driver.getOStream() << "~ ";
}

LogStream::~LogStream() {
   driver.getOStream() << "~\n";
}

HeaderStream::HeaderStream(Driver *driver) 
   :  driver_(driver)
{
   driver.getOStream() << "########################################################\n";
}

HeaderStream::~HeaderStream() {
   driver.getOStream() << "########################################################\n";
}

Driver::Driver(std::ostream &out, 
         bool debug, 
         int cycle_duration = 5, 
         bool abort_on_first_error = false)

   :  out_(out),
      debug_(debug),
      cycle_duration_(cycle_duration), // ms
      abort_on_first_error_(abort_on_first_error)
{
   this->headerText();
}

Driver::~Driver() {
   this->footerText();
   
   if(!this->checkStatus()) {
      this->error() << "Terminating with exit code 1";
      exit(1);
   }
}

void Driver::keyDown(uint8_t row, uint8_t col) {
   out_ << "+ Activating key (" << row << ", " << col << ")\n";
   KeyboardHardware.setKeystate(row, col, Virtual::PRESSED);
}

void Driver::keyUp(uint8_t row, uint8_t col) {
   out_ << "+ Releasing key (" << row << ", " << col << ")\n";
   KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
}

void Driver::tap(uint8_t row, uint8_t col) {
   KeyboardHardware.setKeystate(row, col, Virtual::TAP);
}
 
void Driver::clearAllKeys(self) {
   out_ << "- Clearing all keys\n";
   
   for(byte row = 0; row < KeyboardHardware.matrix_rows; row++) {
      for(byte col = 0; col < KeyboardHardware.matrix_colums; col++) {
         KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
      }
   }
}

void Driver::scanCycle(std::vector<std::shared_ptr<_Assertion>> 
         &on_stop_assertion_list = std::vector<std::shared_ptr<_Assertion>>{}) {
   out_ << "Running single scan cycle\n";
   this->scanCycle(on_stop_assertion_list)
   out_ << "\n";
}

void Driver::scanCycles(int n = 0, 
                  std::vector<std::shared_ptr<_Assertion>> 
                     &on_stop_assertion_list = std::vector<std::shared_ptr<_Assertion>>{}, 
                  std::vector<std::shared_ptr<_Assertion>> 
                     &cycle_assertion_list = std::vector<std::shared_ptr<_Assertion>>{}) {
   if(n == 0) {
      n = scan_cycles_default_count_;
   }
   
   out_ << "Running " << n << " scan cycles\n";
   
   if(!on_stop_assertion_list.empty()) {
      for(auto &assertion: on_stop_assertion_list) {
         this->configureTemporaryAssertion(assertion);
      }
   }
         
   for(std::size_t i = 0; i < n; ++i) { 
      this->scanCycle(cycle_assertion_list, true /* on_log_reports */);
   }
      
   if(!on_stop_assertion_list.empty()) {
      out_ << "Processing " << on_stop_assertion_list.size()
         << " cycle assertions on stop\n";
      this->processCycleAssertions(on_stop_assertion_list);
   }
      
   out_ << "\n";
}

void Driver::skipTime(double delta_t, 
               std::vector<std::shared_ptr<_Assertion>> 
                     &on_stop_assertion_list = std::vector<std::shared_ptr<_Assertion>>{}) {
   
   this->checkCycleDurationSet()
   
   start_cycle = cycle_id_;
   
   out_ << "Skipping dt >= " << delta_t << " ms\n";
         
   if(!on_stop_assertion_list.empty()) {
      for(auto &assertion: on_stop_assertion_list) {
         this->configureTemporaryAssertion(assertion);
      }
   }
         
   start_time = time_;
   
   elapsed_time = 0;
   while(elapsed_time < delta_t) {,
      this->scanCycle(true /* only_log_reports */);
      elapsed_time = time_ - start_time;
   }
      
   out_ << elapsed_time << " ms (" << cycle_id_ << " cycles) skipped\n";
      
   if(!on_stop_assertion_list.empty()) { 
      out_ << "Processing " << on_stop_assertion_list.size() 
         << " cycle assertions on stop\n";
      this->processCycleAssertions(on_stop_assertion_list);
   }
      
   out_ << "\n";
}

void Driver::initKeyboard() {
   this->clearAllKeys();
   ::initializeKeyboard();
}

bool Driver::checkStatus() const {
   
   bool success = true;
   
   if(!queued_keyboard_report_assertions_.empty()) {
      this->error() << "There are " << queued_keyboard_report_assertions_.size()
         << " left over assertions in the queue";
      success = false;
   }
   
   if(!assertions_passed_) {
      this->error() << "Not all assertions passed\n";
      success = false;
   }
      
   if(success) {
      out_ << "All tests passed.\n";
      return true;
   }
   else {
      this->error() << "Errors occurred\n";
   }
   
   return false;
}
      
void Driver::headerText() {
   out_ << "\n";
   out_ << "################################################################################\n";
   out_ << "\n";
   out_ << "Kaleidoscope-Testing\n";
   out_ << "\n";
   out_ << "author: noseglasses (https://github.com/noseglasses, shinynoseglasses@gmail.com)\n";
   out_ << "version: " << kaleidoscope.getVersionString() << "\n";
   out_ << "\n";
   out_ << "cycle duration: " << cycle_duration_ << "\n";
   out_ << "################################################################################\n";
   out_ << "\n";
}

void Driver::footerText() {
   out_ << "\n";
   out_ << "################################################################################\n";
   out_ << "Testing done\n";
   out_ << "################################################################################\n";
   out_ << "\n";
}

void Driver::processKeyboardReport(const KeyboardReport &keyboard_report) {
   
   ++n_keyboard_reports_;
   ++n_reports_in_cycle_;
   
   out_ << "Processing keyboard report "
         << n_keyboard_reports_
         << " (" << n_reports_in_cycle_ << ". in cycle "
         << cycle_id_ << "\n";
                  
   auto n_assertions_queued = queued_keyboard_report_assertions_.size();
   
   out_ << n_assertions_queued
      << " queued report assertions\n";
   
   if(!queued_keyboard_report_assertions_.empty()) {
      this->processKeyboardReportAssertion(queued_keyboard_report_assertions_.popFront(), keyboard_report);
   }
      
   if(!permanent_keyboard_report_assertions_.empty()) {
      
      out_ << permanent_keyboard_report_assertions_.size()
         << " permanent report assertions\n";
      
      for(auto &assertion: permanent_keyboard_report_assertions_.directAccess()) {
         this->processKeyboardReportAssertion(assertion, keyboard_report);
      }
   }
         
   if((n_assertions_queued == 0) && error_if_report_without_queued_assertions_) {
      this->error() << "Encountered a report without assertions being queued";
   }
}
      
void Driver::processKeyboardReportAssertion(std::shared_ptr<_Assertion> &assertion, 
                              const KeyboardReport &keyboard_report) {
   
   current_keyboard_report_ = keyboard_report;
   
   assertion_passed = assertion->eval();
   
   if(!assertion_passed || debug_) {
      assertion->report(out_);
   }
   
   assertions_passed_ &= assertion_passed;
}
            
void Driver::scanCycle(std::vector<std::shared_ptr<_Assertion>> 
         &on_stop_assertion_list = std::vector<std::shared_ptr<_Assertion>>{}, 
         only_log_reports = false) {
   
   ++cycle_id_;
   n_reports_in_cycle_ = 0;
   
   if(!only_log_reports) {
      out_ << "Scan cycle " << cycle_id_ << "\n";
   }
   
   if(on_stop_assertion_list.empty()) {
      for(auto &assertion: on_stop_assertion_list) {
         this->configureTemporaryAssertion(assertion);
      }
   }
   
   ::loop();
   ::nextCycle();
   
   if(n_reports_in_cycle_ == 0) {
      if(!only_log_reports) {
         out_ << "No keyboard reports processed\n";
      }
   }
   else {
      out_ << n_reports_in_cycle_ << " keyboard reports processed\n";
   }
   
   time_ += cycle_duration_;
   
   //kaleidoscope.setMillis(time_)
   
   if(on_stop_assertion_list && !on_stop_assertion_list.empty()) {
      out_ << "Processing " << on_stop_assertion_list.size()
         << " cycle assertions on stop\n";
      this->processCycleAssertions(on_stop_assertion_list);
   }
   
   if(!queued_cycle_assertions_.empty()) {
      out_ << "Processing " << queued_cycle_assertions_.size()
         << " queued cycle assertions\n";
      this->processCycleAssertions(queued_cycle_assertions_.directAccess());
      
      queued_cycle_assertions_.clear();
   }
   
   if(!permanent_cycle_assertions_.empty()) {
      out_ << "Processing " << permanent_cycle_assertions_.size()
         << " permanent cycle assertions\n";
      
      this->processCycleAssertions(permanent_cycle_assertions_.directAccess());
   }
}

void Driver::checkCycleDurationSet() {
   if(cycle_duration_ == 0) {
      this->error() << "Please set test.cycle_duration_ to a value in "
         "[ms] greater zero before using time based testing";
   }
}
