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

#include "assertions/Group.h"

#include <sstream>

namespace kaleidoscope {
namespace testing {
namespace assertions {
   
void Group::Assertion::report(std::ostream &out, const char *add_indent) const {
   out << add_indent << "Assertion group:" << std::endl;
   std::string indent = std::string(add_indent) + "   ";
   for(const auto &assertion: assertions_) {
      assertion->report(out, indent.c_str());
   }
}

void Group::Assertion::setDriver(const Driver *test_driver) {
   for(auto &assertion: assertions_) {
      assertion->setDriver(test_driver);
   }
}

void Group::Assertion::describeState(std::ostream &out, const char *add_indent) const
{
   if(valid_) {
      out << add_indent << "Assertion group valid" << std::endl;
      return;
   }
   else {
      out << add_indent << "Assertion group failed" << std::endl;
   }
   std::string indent = std::string(add_indent) + "   ";
   for(auto &assertion: assertions_) {
      if(!assertion->isValid()) {
         assertion->describeState(out, indent.c_str());
      }
   }
}

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope

