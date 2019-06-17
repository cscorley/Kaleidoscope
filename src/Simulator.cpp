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

#include "Simulator.h"
#include "ActionContainer_Impl.h"
#include "actions/Action_.h"

#include "Kaleidoscope.h"
#include "kaleidoscope/hid.h"
#include "MultiReport/Keyboard.h"

#include <iostream>
#include <iomanip>
#include <ctime>
#include <sstream>

namespace kaleidoscope {
namespace simulator {
   
unsigned long millis = 0;

// Explicit template instanciations
//
template class ActionContainer<ReportAction<KeyboardReport>>;
template class ActionContainer<ReportAction<MouseReport>>;
template class ActionContainer<ReportAction<AbsoluteMouseReport>>;
template class ActionContainer<ReportAction_>;
template class ActionContainer<Action_>;

std::ostream &SimulatorStream_::getOStream() const
{
   return simulator_->getOStream();
}

void SimulatorStream_::checkLineStart() {
   
   if(!line_start_) { return; }
   
   line_start_ = false;
   
   this->reactOnLineStart();
}

void SimulatorStream_::reactOnLineStart()
{
   this->getOStream() << "t=" << /*std::fixed << std::setw(4) << */simulator_->getTime() 
                      << ", c=" << /*std::fixed << std::setw(4) << */simulator_->getCycleId()
                      << ": ";
}

void SimulatorStream_::reactOnLineEnd() 
{
   this->getOStream() << "\n";
}
   
ErrorStream::ErrorStream(const Simulator *simulator) 
   :  SimulatorStream_(simulator)
{
   auto &out = this->getOStream();
   
   // Foreground color red
   //
   out << "\x1B[31;1m";
   
   this->SimulatorStream_::reactOnLineStart();
   out << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Error !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
}
      
ErrorStream::~ErrorStream() {
   
   this->getOStream() << "\n";
   this->SimulatorStream_::reactOnLineStart();
   this->getOStream() << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
   
   if(simulator_->getAbortOnFirstError()) {
      this->SimulatorStream_::reactOnLineStart();
      this->getOStream() << "Bailing out.";
      exit(1);
   }
   
   // Restore color to neutral.
   //
   this->getOStream() << "\x1B[0m";
}

void ErrorStream::reactOnLineStart()
{
   this->SimulatorStream_::reactOnLineStart();
   this->getOStream() << "!!! ";
}

LogStream::LogStream(const Simulator *simulator) 
   :  SimulatorStream_(simulator)
{
}

LogStream::~LogStream() {
   this->getOStream() << "\n";
}

HeaderStream::HeaderStream(const Simulator *simulator) 
   :  SimulatorStream_(simulator)
{  
   // Foreground color red
   //
   this->getOStream() << "\x1B[32;1m";
   
   this->SimulatorStream_::reactOnLineStart();
   this->getOStream() << "################################################################################\n";
}

HeaderStream::~HeaderStream() {
   this->getOStream() << "\n";
   this->SimulatorStream_::reactOnLineStart();
   this->getOStream() << "################################################################################\n";
   
   // Restore color to neutral.
   //
   this->getOStream() << "\x1B[0m";
}

void HeaderStream::reactOnLineStart()
{
   this->SimulatorStream_::reactOnLineStart();
   this->getOStream() << "### ";
}

Test::Test(Simulator *simulator, const char *name) 
   :  simulator_(simulator),
      name_(name),
      error_count_start_(simulator->getErrorCount())
{
   simulator->header() << "Test " << name;
}

Test::~Test() {
   simulator_->assertNothingQueued();
   
   auto error_count_end = simulator_->getErrorCount();
   
   if(error_count_start_ != error_count_end) {
      simulator_->error() << "Test " << name_ << " failed";
   }
}

void Simulator::HIDReportConsumer::processHIDReport(
                  uint8_t id, const void* data, int len)
{
   switch(id) {
      // TODO: React appropriately on the following
      //
      case HID_REPORTID_GAMEPAD:
      case HID_REPORTID_CONSUMERCONTROL:
      case HID_REPORTID_SYSTEMCONTROL:
         simulator_.log() << "***Ignoring hid report with id = " << id;
         break;
      case HID_REPORTID_MOUSE_ABSOLUTE:
         {
            simulator_.processReport(AbsoluteMouseReport{data});
         }
         break;
      case HID_REPORTID_MOUSE:
         {
            simulator_.processReport(MouseReport{data});
         }
         break;
      case HID_REPORTID_NKRO_KEYBOARD:
         {
            simulator_.processReport(KeyboardReport{data});
         }
         break;
      default:
         simulator_.error() << "Encountered unknown HID report with id = " << id;
   }
}

Simulator::Simulator(std::ostream &out, 
         bool debug, 
         int cycle_duration, 
         bool abort_on_first_error)

   :  out_{&out},
      debug_{debug},
      cycle_duration_{cycle_duration}, // ms
      abort_on_first_error_{abort_on_first_error},
      
      queued_report_actions_{*this},
      
      permanent_keyboard_report_actions_{*this},
      permanent_mouse_report_actions_{*this},
      permanent_absolute_mouse_report_actions_{*this},
      permanent_generic_report_actions_{*this},
      
      queued_cycle_actions_{*this},
      permanent_cycle_actions_{*this},
      
      hid_report_consumer_{*this}
{
   KeyboardHardware.setEnableReadMatrix(false);

   ::kaleidoscope::setHIDReportConsumer(hid_report_consumer_);

   this->headerText();
}

Simulator::~Simulator() {
   this->footerText();
   
   if(!test_success_) {
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
                         std::shared_ptr<Action_> after_tap_and_cycles_action ) {
   if(after_tap_and_cycles_action) {
      after_tap_and_cycles_action->setSimulator(this);
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
      
      // Check and execute the action
      //
      if(after_tap_and_cycles_action) {
         this->log() << "Checking action after tap no. " << i;
         if(!after_tap_and_cycles_action->eval()) {
            this->error() << "Action after tap " << i << " failed";
            after_tap_and_cycles_action->report();
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
                  const std::vector<std::shared_ptr<Action_>> &cycle_action_list) {
   if(n == 0) {
      n = scan_cycles_default_count_;
   }
   
   this->log() << "Running " << n << " scan cycles";
         
   for(int i = 0; i < n; ++i) { 
      this->cycleInternal(true /* on_log_reports */);
      this->evaluateActionsInternal(cycle_action_list);
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

bool Simulator::checkStatus() {
   
   if(!queued_report_actions_.empty()) {
      this->error() << "There are " << queued_report_actions_.size()
         << " left over actions in the queue.";
      test_success_ = false;
   }
   
   if(!actions_passed_) {
      this->error() << "Not all actions passed.";
      test_success_ = false;
   }
   
   if(error_count_ != 0) {
      test_success_ = false;
   }
      
   if(test_success_) {
      this->log() << "All tests passed.";
      return true;
   }
   else {
      this->error() << "Errors occurred.";
   }
   
   return false;
}
      
void Simulator::headerText() {
   
   // Foreground color yellow
   //
   this->getOStream() << "\x1B[33;1m";
   
   this->log() << "";
   this->log() << "################################################################################";
   this->log() << "";
   this->log() << "Kaleidoscope-Simulator";
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
   
   // Foreground color yellow
   //
   this->getOStream() << "\x1B[33;1m";
   
   this->log() << "";
   this->log() << "################################################################################";
   this->log() << "Testing done";
   this->log() << "";
   this->log() << "duration: " << time_ << " ms = " << cycle_id_ << " cycles";
   this->log() << "error_count: " << error_count_;
   this->log() << "";
   this->log() << "num. overall reports processed: " << n_typed_reports_in_cycle_[AnyTypeReportSid];
   this->log() << "num. keyboard reports processed: " << n_typed_reports_in_cycle_[KeyboardReportSid];
   this->log() << "num. mouse reports processed: " << n_typed_reports_in_cycle_[MouseReportSid];
   this->log() << "num. absolute mouse reports processed: " << n_typed_reports_in_cycle_[AbsoluteMouseReportSid];
   this->log() << "";
   this->checkStatus();
   this->getOStream() << "\x1B[33;1m";
   this->log() << "";
   this->log() <<  "################################################################################";
   this->log() << "";
   
   // Restore color to neutral.
   //
   //this->getOStream() << "\x1B[0m";
   this->getOStream() << "\x1B[0m";
}
            
void Simulator::cycleInternal(bool only_log_reports) {
   
   ++cycle_id_;
   n_reports_in_cycle_ = 0;
   
   for(int i = 0; i < 3; ++i) {
      n_typed_reports_in_cycle_[i] = 0;
   }
   
   if(!only_log_reports) {
      this->log() << "Scan cycle " << cycle_id_;
   }
   
   // Set the global simulator time.
   //
   millis = time_;

   ::loop();
   
   if(n_reports_in_cycle_ == 0) {
      if(!only_log_reports) {
         this->log() << "No keyboard reports processed";
      }
   }
   else {
      this->log() << n_reports_in_cycle_ << " keyboard reports processed";
   }
   
   time_ += cycle_duration_;
   
   //kaleidoscope.setMillis(time_)
   
   if(!queued_cycle_actions_.empty()) {
      this->log() << "Processing " << queued_cycle_actions_.size()
         << " queued cycle actions";
      this->evaluateActionsInternal(queued_cycle_actions_.directAccess());
      
      queued_cycle_actions_.clear();
   }
   
   if(!permanent_cycle_actions_.empty()) {
      this->log() << "Processing " << permanent_cycle_actions_.size()
         << " permanent cycle actions";
      
      this->evaluateActionsInternal(permanent_cycle_actions_.directAccess());
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
   if(!queued_report_actions_.empty()) {
      this->error() << "Keyboard report actions are left in queue";
   }
   
   if(!queued_cycle_actions_.empty()) {
      this->error() << "Cycle actions are left in queue";
   }
}

void Simulator::assertCondition(bool cond, const char *action_code) const
{
   if(!cond) {
      this->error() << "Action failed: " << action_code;
   }
}

void Simulator::runRealtime(TimeType duration, 
                         const std::function<void()> &cycle_function)
{
   auto n_cycles = duration/cycle_duration_;
   
   static constexpr double inv_clocks_per_sec = 1.0/CLOCKS_PER_SEC;
      
   for(decltype(n_cycles) i = 0; i < n_cycles; ++i) {
      
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
      
} // namespace simulator
} // namespace kaleidoscope

unsigned long millis(void) {
  return kaleidoscope::simulator::millis;
}
