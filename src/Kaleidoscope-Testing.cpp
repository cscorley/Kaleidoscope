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

// This function can be overridden in the user sketch to define
// firmware test runs.
//   
__attribute__((weak))
void runTest(Driver &) {}

} // namespace testing
} // namespace kaleidoscope

// This is an override of the weak function defined in main.cpp
// of the virtual core.
//
void executeTestFunction() {
   Driver driver(std::ostream, false);
   runTest(driver);
}
