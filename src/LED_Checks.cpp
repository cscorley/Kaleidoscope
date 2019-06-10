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

#include "LED_Checks.h"
#include "Simulator.h"

#include "Kaleidoscope.h"

#include <iostream>

namespace kaleidoscope {
namespace simulator {
   
void dumpKeyLEDState() {
   
   std::cout << "const cRGB key_led_colors[] = {\n";
   
   for(uint8_t row = 0; row < KeyboardHardware.matrix_rows; ++row) {
      for(uint8_t col = 0; col < KeyboardHardware.matrix_columns; ++col) {
         
         auto color = KeyboardHardware.getCrgbAt(row, col);
         
         std::cout << "   CRGB(" << (int)color.r << ", " 
                                           << (int)color.g << ", " 
                                           << (int)color.b << "),\n";
      }
   }
   
   std::cout << "};\n\n";
}

void assertKeyLEDState(const Simulator &simulator,
                       const cRGB *key_led_colors)
{
   for(uint8_t row = 0; row < KeyboardHardware.matrix_rows; ++row) {
      for(uint8_t col = 0; col < KeyboardHardware.matrix_columns; ++col) {
         
         uint8_t pos = row*KeyboardHardware.matrix_columns + col;
         
         const cRGB &color_expected = key_led_colors[pos];
         
         auto color_actual = KeyboardHardware.getCrgbAt(row, col);
         
         if(   (color_expected.r != color_actual.r)
            || (color_expected.g != color_actual.g)
            || (color_expected.b != color_actual.b)) {
            
            simulator.error() << "LED color mismatch at (" << (int)row << ", " << (int)col << ")";
         
            simulator.error() << "   expected: (" << (int)color_expected.r << ", " 
                                               << (int)color_expected.g << ", " 
                                               << (int)color_expected.b << ")";
                                               
            simulator.error() << "   actual: ("   << (int)color_actual.r << ", " 
                                               << (int)color_actual.g << ", " 
                                               << (int)color_actual.b << ")";                                   
         }
      }
   }
}

} // namespace simulator
} // namespace kaleidoscope
