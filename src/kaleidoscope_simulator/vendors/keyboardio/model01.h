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

#ifdef KALEIDOSCOPE_VIRTUAL_BUILD

namespace kaleidoscope {
namespace simulator {
namespace keyboardio {
namespace model01 {

/// @brief A formatted string that represents the keyboard layout of
///        the Keyboardio Model01.
/// @details Use this string with the renderKeyboard(...) function.
///
extern const char *ascii_keyboard;

} // namespace model01
} // namespace keyboardio
} // namespace simulator
} // namespace kaleidoscope

#endif // KALEIDOSCOPE_VIRTUAL_BUILD
