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

namespace kaleidoscope {
namespace testing {
   
class Simulator;
   
/// @brief Renders a keyboard's asscii representation.
///
/// @param simulator The parent simulator object.
/// @param ascii_keyboard The ascii representation of the keyboards
///        key layout.
///
void renderKeyboard(const Simulator &simulator, const char *ascii_keyboard);

} // namespace testing
} // namespace kaleidoscope
