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

#include "papilio/LED_Checks.h"
#include "papilio/Simulator.h"
#include "papilio/SimulatorCore_.h"

#include <iostream>

namespace papilio {
   
void dumpKeyLEDState(const Simulator &simulator) {
   
   std::cout << "const uint8_t key_led_colors[][3] = {\n";
   
   const auto &simulator_core = simulator.getCore();
   
   uint8_t rows = 0, cols = 0;
   
   simulator_core.getKeyMatrixDimensions(rows, cols);
   
   for(uint8_t row = 0; row < rows; ++row) {
      for(uint8_t col = 0; col < cols; ++col) {
         
         uint8_t red = 0, green = 0, blue = 0;
         
         uint8_t led_id = row*cols + col;
         
         simulator_core.getCurrentKeyLEDColor(led_id, 
                               red, green, blue);
         
         std::cout << "   {" << (int)red << ", " 
                             << (int)green << ", " 
                             << (int)blue << "},\n";
      }
   }
   
   std::cout << "};\n\n";
}

void assertKeyLEDState(const Simulator &simulator,
                       const uint8_t key_led_colors[][3])
{
   const auto &simulator_core = simulator.getCore();
   
   uint8_t num_leds = simulator_core.getNumLEDs();
   
   for(uint8_t led_id = 0; led_id < num_leds; ++led_id) {
         
      const uint8_t &red_expected = key_led_colors[led_id][0];
      const uint8_t &green_expected = key_led_colors[led_id][1];
      const uint8_t &blue_expected = key_led_colors[led_id][2];
      
      uint8_t red_actual = 0, green_actual = 0, blue_actual = 0;
      
      simulator_core.getCurrentKeyLEDColor(led_id, 
                              red_actual, green_actual, blue_actual);
      
      if(   (red_expected != red_actual)
         || (green_expected != green_actual)
         || (blue_expected != blue_actual)) {
         
         simulator.error() << "LED color mismatch at LED " << (int)led_id;
      
         simulator.error() << "   expected: (" << (int)red_expected << ", " 
                                             << (int)green_expected << ", " 
                                             << (int)blue_expected << ")";
                                             
         simulator.error() << "   actual: ("   << (int)red_actual << ", " 
                                             << (int)green_actual << ", " 
                                             << (int)blue_actual << ")";                                   
      }
   }
}

} // namespace papilio
