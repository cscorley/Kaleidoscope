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

#include "assertions/_Assertion.h"
#include "aux/demangle.h"
#include "Simulator.h"

namespace kaleidoscope {
namespace simulator {

void _Assertion::report(const char *add_indent) const 
{
   if(this->valid_) {
      {
         auto log = driver_->log();
         log << add_indent;
         if(this->negate_) {
            log << "negated ";
         }
         log << type(*this) << " assertion passed";
      }
      //this->describe();
   }
   else {
      std::string indent = std::string(add_indent) + "      ";
      {
         auto error = driver_->error();
         error << add_indent;
         if(negate_) {
            error << "negated ";
         }
         error << type(*this) << " assertion failed";
      }
      driver_->log() << add_indent << "expected:";
      this->describe(indent.c_str());
      driver_->log() << add_indent << "actual:";
      this->describeState(indent.c_str());
   }
}

void _Assertion::describeState(const char *add_indent) const {
   if(valid_) {
      driver_->log() << add_indent << "valid";
   }
   else {
      driver_->error() << add_indent << "failed";
   }
}

} // namespace simulator
} // namespace kaleidoscope
