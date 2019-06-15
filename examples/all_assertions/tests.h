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

#ifdef ARDUINO_VIRTUAL

#include "Kaleidoscope-Simulator.h"
#include "vendors/keyboardio/model01.h"
   
KALEIDOSCOPE_SIMULATOR_INIT

namespace kaleidoscope {
namespace simulator {
   
void runSimulator(Simulator &simulator) {
   
   using namespace assertions;
   
   //simulator.permanentKeyboardReportAssertions().add(DumpReport{});
   
   //***************************************************************************
   {
      auto test = simulator.newTest("0");
      
      // Assert that the next cycle generates exactly one keyboard report.
      //
      simulator.cycleAssertionsQueue().queue(CycleGeneratesNReports<KeyboardReport>{1});
      
      simulator.tapKey(2, 1); // A
      simulator.cycleExpectReports(KeycodesActive{Key_A});

      simulator.cycleExpectReports(ReportEmpty{});
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("1");
         
      simulator.pressKey(2, 1); // A
      simulator.cycleExpectReports(KeycodesActive{Key_A});
         
      simulator.reportAssertionsQueue().queue(
         group(
            KeycodesActive{Key_A},
            KeycodesActive{Key_B},
            ReportEmpty{}.negate(),
            AnyModifierActive{}.negate(),
            AnyKeycodeActive{},
            ReportNthInCycle{1},
            DumpReport{}
         )
      );
      simulator.pressKey(3, 5); // B
      simulator.cycle();
      simulator.releaseKey(2, 1); // A
      simulator.releaseKey(3, 5); // B
      
      simulator.cycles(5);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("2");
         
      simulator.pressKey(2, 1); // A
      simulator.cycleExpectReports(KeycodesActive{Key_A});
         
      simulator.pressKey(3, 5); // B
      simulator.cycleExpectReports(
         group(
            KeycodesActive{Key_A},
            KeycodesActive{Key_B}
         )
      );
      
      simulator.releaseKey(2, 1);
      simulator.releaseKey(3, 5);
      
      simulator.cycles(5);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("3");
   
      simulator.pressKey(2, 1); // A
      simulator.cycle();
      simulator.pressKey(3, 5); // B
      simulator.cycleExpectReports(KeycodesActive{Key_A, Key_B});
      
      simulator.releaseKey(2, 1);
      simulator.releaseKey(3, 5);
      simulator.cycles(5);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("4");

      auto layer_check = TopActiveLayerIs{0};
      simulator.permanentCycleAssertions().add(layer_check);
      simulator.cycle();
      simulator.permanentCycleAssertions().remove(layer_check);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("5");
      
      simulator.cycleAssertionsQueue().queue(CycleGeneratesNReports<KeyboardReport>{1});
      simulator.tapKey(3, 7); // left shift
      simulator.cycleExpectReports(ModifiersActive{Key_LeftShift});
      
      simulator.cycleAssertionsQueue().queue(CycleGeneratesNReports<KeyboardReport>{1});
      simulator.cycleExpectReports(ReportEmpty{});
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("6");

      simulator.cycleAssertionsQueue().queue(CycleGeneratesNReports<KeyboardReport>{1});
      simulator.pressKey(3, 7); // left shift
      simulator.cycleExpectReports(
         group(
            ModifiersActive{Key_LeftShift},
            AnyModifierActive{}
         )
      );
        
      simulator.pressKey(0, 7); // left control
      simulator.cycleExpectReports(
         group(
            ModifiersActive{Key_LeftShift, Key_LeftControl},
            AnyKeycodeActive{}.negate()
         )
      );
      
      simulator.releaseKey(3, 7); // left shift
      simulator.releaseKey(0, 7); // left control
      simulator.cycleExpectReports(ReportEmpty{});
      
      simulator.cycles(4);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("7");
   
      simulator.cycleAssertionsQueue().queueGrouped(
         NumOverallReportsGenerated<KeyboardReport>{16},
         CycleIsNth{34},
         ElapsedTimeGreater{160}
      );
      simulator.cycle();
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("8");
   
      simulator.cycles(10);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("9");
    
      simulator.advanceTimeBy(1000); // ms
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("10");
      simulator.tapKey(3, 7); // left shift
      simulator.tapKey(2, 1); // A
      simulator.cycleExpectReports(DumpReport{});
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("11");
      
      simulator.tapKey(3, 7); // left shift
      simulator.cycleExpectReports(
         CustomReportAssertion<KeyboardReport>{
            [&](const KeyboardReport &kr) -> bool {
               simulator.log() << "Custom keyboard report assertion triggered";
               return true;
            }
         }
      );
      simulator.cycles(5);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("12");
      
      simulator.tapKey(3, 7); // left shift
      simulator.cycleExpectReports(
         CustomReportAssertion<Report_>{
            [&](const Report_ &report) -> bool {
               simulator.log() << "Custom cycle assertion triggered";
               return true;
            }
         }
      );
      simulator.cycles(5);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("13");
      
      simulator.advanceTimeTo(2000); // ms
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("14");
      
      // Cycle through the color effects and output the keyboard
      // after some cycles.
      //
      simulator.multiTapKey(15 /*num. taps*/, 
                         0 /*row*/, 6/*col*/, 
                         50 /* num. cycles after each tap */,
                         CustomAssertion{
                            [&]() -> bool {
                               renderKeyboard(simulator, keyboardio::model01::ascii_keyboard);
                               return true;
                            }
                         }
      );
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("15");
      
      // LED effect solid red is the fourth LED effect. Tap the 
      // LED effect forward key four times to get there.
      //
      simulator.multiTapKey(4 /*num. taps*/, 
                         0 /*row*/, 6/*col*/, 
                         1 /* num. cycles after each tap */,
                         CustomAssertion{
                            [&]() -> bool {
                               simulator.log() << "KeyboardHardware.getCrgbAt(0, 0).r = " 
                                 << (int)KeyboardHardware.getCrgbAt(0, 0).r;
                               return true;
                            }
                         }
      );
      
      KT_ASSERT_CONDITION(simulator, KeyboardHardware.getCrgbAt(0, 0).r == solid_red_level);
   }
   
   //***************************************************************************
   {
      auto test = simulator.newTest("16");
      
      // Use dumpKeyLEDState to generate a representation of the current
      // LED state.
      //
      //dumpKeyLEDState();
      
      const cRGB key_led_colors[] = {
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(0, 3, 196),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
         CRGB(160, 0, 0),
      };

      assertKeyLEDState(simulator, key_led_colors);
   }
}

} // namespace simulator
} // namespace kaleidoscope

#endif
