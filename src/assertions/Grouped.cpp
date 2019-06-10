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

#include "assertions/Grouped.h"

#include <sstream>

namespace kaleidoscope {
namespace simulator {
namespace assertions {
   
void Grouped::Assertion::report(const char *add_indent) const {
   driver_->log() << add_indent << "Assertion group:";
   std::string indent = std::string(add_indent) + "   ";
   for(const auto &assertion: assertions_) {
      assertion->report(indent.c_str());
   }
}

void Grouped::Assertion::setDriver(const Simulator *simulator) {
   this->_Assertion::setDriver(simulator);
   
   for(auto &assertion: assertions_) {
      assertion->setDriver(simulator);
   }
}

void Grouped::Assertion::describeState(const char *add_indent) const
{
   if(valid_) {
      driver_->log() << add_indent << "Assertion group valid";
      return;
   }
   else {
      driver_->log() << add_indent << "Assertion group failed";
   }
   std::string indent = std::string(add_indent) + "   ";
   for(auto &assertion: assertions_) {
      if(!assertion->isValid()) {
         assertion->describeState(indent.c_str());
      }
   }
}

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope

