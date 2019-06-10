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

#include "assertions/_Assertion.h"
#include "kaleidoscope/key_defs.h"

namespace kaleidoscope {
namespace simulator {
namespace assertions {

/// @brief Asserts that the current keyboard report is empty.
///
class ReportEmpty {
   
   public:
      
      KT_ASSERTION_STD_CONSTRUCTOR(ReportEmpty)
   
   private:
      
      class Assertion : public _Assertion {
            
         public:

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << "Report empty";
            }

            virtual void describeState(const char *add_indent = "") const {
               driver_->log() << add_indent << "Report: ";
               driver_->getCurrentKeyboardReport().dump(*driver_, add_indent);
            }

            virtual bool evalInternal() override {
               return !driver_->getCurrentKeyboardReport().isAnyKeyActive()
                   && !driver_->getCurrentKeyboardReport().isAnyModifierActive();
            }
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(ReportEmpty)
};

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
