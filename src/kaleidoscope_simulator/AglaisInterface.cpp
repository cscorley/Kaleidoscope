/* -*- mode: c++ -*-
 * Papilio - A keyboard simulation framework 
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

#include "kaleidoscope_simulator/AglaisInterface.h"
#include "kaleidoscope_simulator/reports/KeyboardReport.h"
#include "kaleidoscope_simulator/reports/BootKeyboardReport.h"
#include "kaleidoscope_simulator/reports/MouseReport.h"
#include "kaleidoscope_simulator/reports/AbsoluteMouseReport.h"
#include "Aglais.h"
#include "aglais/Consumer_.h"
#include "papilio/actions/generic_report/AssertReportEquals.h"
#include "papilio/Simulator.h"
#include "HID-Settings.h"

namespace kaleidoscope {
namespace simulator {
   
/// @private
///
class SimulatorConsumerAdaptor : public aglais::Consumer_
{
   public:
      
      SimulatorConsumerAdaptor(papilio::Simulator &simulator)
         :  simulator_(simulator)
      {}
      
      virtual void onFirmwareId(const char *firmware_id) override {
         simulator_.log() << "Aglais: firmware_id " << firmware_id;
         // TODO: Use this method to verify that the firmware that was used
         //       to generate the Aglais-script that is currently 
         //       parsed matches the firmware running in the simulator.
      }
      
      virtual void onStartCycle(uint32_t cycle_id, uint32_t cycle_start_time) override {
         //simulator_.log() << "Aglais: start_cycle " << cycle_id << ' ' << cycle_start_time;
         simulator_.setTime(cycle_start_time);
      }
      virtual void onEndCycle(uint32_t cycle_id, uint32_t cycle_end_time) override {
         //simulator_.log() << "Aglais: end_cycle " << cycle_id << ' ' << cycle_end_time; 
         
         simulator_.cycle(true /*suppress cycle log info*/);
         
         if(!simulator_.reportActionsQueue().empty()) {
            simulator_.error() << "Report actions are left in queue";
         }
         
         simulator_.setTime(cycle_end_time);
      }
      virtual void onKeyPressed(uint8_t row, uint8_t col) override {
         simulator_.log() << "Aglais: action key_pressed " << (int)row << ' ' << (int)col;
         simulator_.pressKey(row, col);
      }
      virtual void onKeyReleased(uint8_t row, uint8_t col) override {
         simulator_.log() << "Aglais: action key_released " << (int)row << ' ' << (int)col;
         simulator_.releaseKey(row, col);
      }
      virtual void onHIDReport(uint8_t id, int length, const uint8_t *data) override {
         {
            auto log = simulator_.log();
            
            log << "Aglais: reaction hid_report " << (int)id << ' ' << (int)length << ' ';
            for(int i = 0; i < length; ++i) {
               log << (int)data[i] << ' ';
            }
         }
            
         switch(id) {
            // TODO: React appropriately on the following
            //
            case HID_REPORTID_GAMEPAD:
            case HID_REPORTID_CONSUMERCONTROL:
            case HID_REPORTID_SYSTEMCONTROL:
               simulator_.log() << "***Ignoring hid report with id = " << id;
               break;
            case HID_REPORTID_KEYBOARD:
               {
                  assert(length == sizeof(BootKeyboardReport::ReportDataType));
                  simulator_.reportActionsQueue().queue(
                     papilio::actions::AssertReportEquals<BootKeyboardReport>{data}
                  );
               }
               break;
            case HID_REPORTID_MOUSE_ABSOLUTE:
               {
                  assert(length == sizeof(AbsoluteMouseReport::ReportDataType));
                  simulator_.reportActionsQueue().queue(
                     papilio::actions::AssertReportEquals<AbsoluteMouseReport>{data}
                  );
               }
               break;
            case HID_REPORTID_MOUSE:
               {
                  assert(length == sizeof(MouseReport::ReportDataType));
                  simulator_.reportActionsQueue().queue(
                     papilio::actions::AssertReportEquals<MouseReport>{data}
                  );
               }
               break;
            case HID_REPORTID_NKRO_KEYBOARD:
               {
                  assert(length == sizeof(KeyboardReport::ReportDataType));
                  simulator_.reportActionsQueue().queue(
                     papilio::actions::AssertReportEquals<KeyboardReport>{data}
                  );
               }
               break;
            default:
               simulator_.error() << "Aglais encountered unknown HID report with id = " << id;
         }
      }
      virtual void onSetTime(uint32_t time) override {
         simulator_.log() << "Aglais: set_time " << time;
         simulator_.setTime(time);
      }
      virtual void onCycle(uint32_t cycle_id, uint32_t cycle_start_time, uint32_t cycle_end_time) {
         this->onStartCycle(cycle_id, cycle_start_time);
         this->onEndCycle(cycle_id, cycle_end_time);
      }
      virtual void onCycles(uint32_t start_cycle_id, uint32_t start_time_id, 
                               const std::vector<uint32_t> &cycle_durations) override {
         auto cycle_start_time = start_time_id;
         auto cycle_id = start_cycle_id;
         for(const auto duration: cycle_durations) {
            auto cycle_end_time = cycle_start_time + duration;
            this->onCycle(cycle_id, cycle_start_time, cycle_end_time);
            ++cycle_id;
            cycle_start_time = cycle_end_time;
         }
      }
      
   private:
      
      papilio::Simulator &simulator_;
      
};

void processAglaisDocument(const char *code, papilio::Simulator &simulator)
{
   auto rwqa_state = simulator.getErrorIfReportWithoutQueuedActions();
   
   aglais::Aglais a;
   //a.setDebug(true);
   
   SimulatorConsumerAdaptor sca(simulator);
   a.parse(code, sca);
   
   simulator.setErrorIfReportWithoutQueuedActions(rwqa_state);
}

} // namespace simulator
} // namespace kaleidoscope
