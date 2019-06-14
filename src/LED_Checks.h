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

#pragma once

#include "Kaleidoscope.h"

namespace kaleidoscope {
namespace simulator {
   
class Simulator;

/// @brief Dumps the state of the key LEDs as C++ code
///
void dumpKeyLEDState();

/// @brief Compares the current state of the key LEDs to a representation
///        stored in an array.
/// @param key_led_colors An array of key LED state data to compare the current
///                       state with.
///
void assertKeyLEDState(const Simulator &simulator,
                       const cRGB *key_led_colors);
   
} // namespace simulator
} // namespace kaleidoscope
