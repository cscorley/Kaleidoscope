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

#include "actions/Action_.h"
#include "aux/demangle.h"
#include "Simulator.h"

namespace papilio {

void Action_::report(const char *add_indent) const 
{
   if(this->valid_) {
      {
         auto log = simulator_->log();
         log << add_indent;
         if(this->negate_) {
            log << "negated ";
         }
         log << type(*this) << " action passed";
      }
      //this->describe();
   }
   else {
      std::string indent = std::string(add_indent) + "      ";
      {
         auto error = simulator_->error();
         error << add_indent;
         if(negate_) {
            error << "negated ";
         }
         error << type(*this) << " action failed";
      }
      simulator_->log() << add_indent << "expected:";
      this->describe(indent.c_str());
      simulator_->log() << add_indent << "actual:";
      this->describeState(indent.c_str());
   }
}

void Action_::describeState(const char *add_indent) const {
   if(valid_) {
      simulator_->log() << add_indent << "valid";
   }
   else {
      simulator_->error() << add_indent << "failed";
   }
}

} // namespace papilio
