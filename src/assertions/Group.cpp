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

#include "AssertionGroup.h"

#include <ostringstream>

namespace kaleidoscope {
namespace testing {
   
void Group::Assertion::report(std::ostream &out, const char *add_indent) const {
   out << add_indent << "Assertion group:" << std::endl;
   std::string indent = std::string(add_indent) + "   ";
   for(const auto &assertion: assertions_) {
      assertion->report(out, indent.c_str());
   }
}

void Group::Assertion::setTestDriver(std::weak_ptr<TestDriver> test_driver) {
   for(auto &assertion: assertions_) {
      assertion->setTestDriver(test_driver);
   }
}

void Group::Assertion::describeState(std::ostream &out, const char *add_indent) const
{
   std::ostringstream out;
   if(valid_) {
      out << add_indent << "Assertion group valid" << std::endl;
      return out.str();
   }
   else {
      out << add_indent << "Assertion group failed" << std::endl;
   }
   std::string indent = std::string(add_indent) + "   ";
   for(auto &assertion: assertions_) {
      if(!assertion->isValid()) {
         out << assertion->getStateDescription(indent);
      }
   }
   return out.str();
}

} // namespace testing
} // namespace kaleidoscope

