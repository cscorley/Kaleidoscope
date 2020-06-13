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

#pragma once

#ifdef KALEIDOSCOPE_VIRTUAL_BUILD

namespace papilio {
namespace terminal_escape_sequences {

constexpr char reset_formatting[] = "\x1B[0m";
constexpr char underlined[] = "\x1B[4m";
constexpr char clear_screen[] = "\033[2J\033[1;1H";
constexpr char cursor_to_upper_left[] = "\x1B[0;0H";

} // namespace terminal_escape_sequences
} // namespace papilio

#endif // KALEIDOSCOPE_VIRTUAL_BUILD
