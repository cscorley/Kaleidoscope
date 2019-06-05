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

#pragma once

#include <string>
#include <typeinfo>

namespace kaleidoscope {
namespace testing {

/// @brief Demangles a C++ symbol name.
///
std::string demangle(const char* name);

/// @brief Returns a human readable representation of a typename.
///
template <class T>
std::string type(const T& t) {
    return demangle(typeid(t).name());
}

} // namespace testing
} // namespace kaleidoscope
