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

#include "Simulator.h"
#include "assertions/_Assertion.h"

#include "Kaleidoscope.h"
#include "kaleidoscope/hid.h"
#include "MultiReport/Keyboard.h"

#include <iostream>
#include <iomanip>
#include <ctime>
#include <sstream>

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
   
ErrorStream::ErrorStream(const Simulator *simulator) 
   :  DriverStream_(simulator)
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

LogStream::LogStream(const Simulator *simulator) 
   :  DriverStream_(simulator)
{
}

LogStream::~LogStream() {
   this->getOStream() << "\n";
}

HeaderStream::HeaderStream(const Simulator *simulator) 
   :  DriverStream_(simulator)
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

Test::Test(Simulator *simulator, const char *name) 
   :  driver_(simulator),
      name_(name),
      error_count_start_(simulator->getErrorCount())
{
   simulator->header() << "Test " << name;
}

Test::~Test() {
   driver_->assertNothingQueued();
   
   auto error_count_end = driver_->getErrorCount();
   
   if(error_count_start_ != error_count_end) {
      driver_->error() << "Test " << name_ << " failed";
   }
}

void Simulator::KeyboardReportConsumer::processKeyboardReport(
                           const HID_KeyboardReport_Data_t &report_data)
{
   driver_.processKeyboardReport(report_data);
}

Simulator::Simulator(std::ostream &out, 
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

Simulator::~Simulator() {
   this->footerText();
   
   if(!this->checkStatus()) {
      this->error() << "Terminating with exit code 1";
      exit(1);
   }
}

using namespace kaleidoscope::hardware;

void Simulator::pressKey(uint8_t row, uint8_t col) {
   this->log() << "+ Activating key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::PRESSED);
}

void Simulator::releaseKey(uint8_t row, uint8_t col) {
   this->log() << "+ Releasing key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
}

void Simulator::tapKey(uint8_t row, uint8_t col) {
   this->log() << "+- Tapping key (" << (unsigned)row << ", " << (unsigned)col << ")";
   KeyboardHardware.setKeystate(row, col, Virtual::TAP);
}

void Simulator::multiTapKey(int num_taps, uint8_t row, uint8_t col, 
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
 
void Simulator::clearAllKeys() {
   this->log() << "- Clearing all keys";
   
   for(byte row = 0; row < KeyboardHardware.matrix_rows; row++) {
      for(byte col = 0; col < KeyboardHardware.matrix_columns; col++) {
         KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
      }
   }
}

void Simulator::cycle() {
   this->log() << "Running single scan cycle";
   this->cycleInternal(true);
   this->log() << "";
}

void Simulator::cyclesInternal(int n, 
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

void Simulator::advanceTimeBy(Simulator::TimeType delta_t) {
   
   this->checkCycleDurationSet();
   
   this->log() << "Skipping dt >= " << delta_t << " ms";
   
   this->skipTimeInternal(delta_t);
}

void Simulator::skipTimeInternal(Simulator::TimeType delta_t) {
   
   auto start_cycle = cycle_id_;
         
   auto start_time = time_;
   
   Simulator::TimeType elapsed_time = 0;
   while(elapsed_time < delta_t) {
      this->cycleInternal(true /* only_log_reports */);
      elapsed_time = time_ - start_time;
   }
      
   this->log() << elapsed_time << " ms (" << (cycle_id_ - start_cycle) << " cycles) skipped";
      
   this->log() << "";
}

void Simulator::advanceTimeTo(TimeType time)
{
   if(time <= time_) {
      this->error() << "Failed cycling to time " << time << " ms. Target time is in the past.";
      return;
   }
   
   this->log() << "Cycling to t = " << time << " ms";
   
   TimeType delta_t = time - time_;
   
   this->skipTimeInternal(delta_t);
}

void Simulator::initKeyboard() {
   this->clearAllKeys();
   kaleidoscope::hid::initializeKeyboard();
}

bool Simulator::checkStatus() const {
   
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
      
void Simulator::headerText() {
   
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

void Simulator::footerText() {
   
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

void Simulator::processKeyboardReport(const HID_KeyboardReport_Data_t &report_data) {
   
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
      
void Simulator::processKeyboardReportAssertion(const std::shared_ptr<_Assertion> &assertion) {
   
   bool assertion_passed = assertion->eval();
   
   if(!assertion_passed || debug_) {
      assertion->report();
   }
   
   assertions_passed_ &= assertion_passed;
}
            
void Simulator::cycleInternal(bool only_log_reports) {
   
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

void Simulator::checkCycleDurationSet() {
   if(cycle_duration_ == 0) {
      this->error() << "Please set test.cycle_duration_ to a value in "
         "[ms] greater zero before using time based testing";
   }
}

void Simulator::assertNothingQueued() const
{
   if(!queued_keyboard_report_assertions_.empty()) {
      this->error() << "Keyboard report assertions are left in queue";
   }
   
   if(!queued_cycle_assertions_.empty()) {
      this->error() << "Cycle assertions are left in queue";
   }
}

void Simulator::assertCondition(bool cond, const char *assertion_code) const
{
   if(!cond) {
      this->error() << "Assertion failed: " << assertion_code;
   }
}

void Simulator::runRealtime(TimeType duration, 
                         const std::function<void()> &cycle_function)
{
   auto n_cycles = duration/cycle_duration_;
   
   static constexpr double inv_clocks_per_sec = 1.0/CLOCKS_PER_SEC;
      
   for(int i = 0; i < n_cycles; ++i) {
      
      auto begin_cycle = std::clock();
      
      this->cycle();
      cycle_function();
      
      // Slow down the simulation if necessary.
      //
      double elapsed_ms = 0;
      do {
         auto cur_time = std::clock();
         elapsed_ms = 1000*double(cur_time - begin_cycle)*inv_clocks_per_sec;
      } while(elapsed_ms < 5);
   }
}
      
void Simulator::runRemoteControlled(const std::function<void()> &cycle_function)
{
   while(1) {
      
      std::string line;
      std::getline(std::cin, line);
      
      if(line.empty() || line[0] == '.') {
         continue;
      }
      
      constexpr uint8_t n_bytes = 8;
      uint16_t key_bitfield[n_bytes] = {}; // We use uint16_t here as 
                                           // uint8_t is parsed as char
                                           // during stream input.
      
      std::istringstream line_stream(line);
      for(uint8_t byte_id = 0; byte_id < n_bytes; ++byte_id) {
         line_stream >> key_bitfield[byte_id];
      }
   
      for(uint8_t row = 0; row < KeyboardHardware.matrix_rows; ++row) {
         for(uint8_t col = 0; col < KeyboardHardware.matrix_columns; ++col) {
            uint16_t pos = row*KeyboardHardware.matrix_columns + col;
            
            uint8_t byte_id = pos/n_bytes;
            uint8_t bit_id = pos%n_bytes;
            
            bool is_keyswitch_pressed = bitRead(key_bitfield[byte_id], bit_id);// & (1 << bit_id);
            
            if(is_keyswitch_pressed) {
               
               if(!KeyboardHardware.wasKeyswitchPressed(row, col)) {
//                   std::cout << "byte_id: " << (int)byte_id << std::endl;
//                   std::cout << "bit_id: " << (int)bit_id << std::endl;
//                   std::cout << "byte: " << (int)key_bitfield[byte_id] << std::endl;
//                   std::cout << "Keyswitch (" << (int)row << ", " << (int)col << ") pressed" << std::endl;
//                   std::cout << "line: " << line << std::endl;
                  KeyboardHardware.setKeystate(row, col, Virtual::PRESSED);
               }
            }
            else {
               if(KeyboardHardware.wasKeyswitchPressed(row, col)) {
                  //std::cout << "Keyswitch (" << (int)row << ", " << (int)col << ") released" << std::endl;
                  KeyboardHardware.setKeystate(row, col, Virtual::NOT_PRESSED);
               }
            }
         }
      }
      
      cycleInternal(true /*only log reports*/);
      cycle_function();
   }
}
      
} // namespace testing
} // namespace kaleidoscope
