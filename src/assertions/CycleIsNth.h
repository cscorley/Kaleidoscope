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

#include "assertions/_Assertion.h"

namespace kaleidoscope {
namespace testing {
namespace assertions {
   
/// @brief Asserts that the current cycle is the nth.
///
class CycleIsNth {
   
   public:
   
      /// @brief Constructor
      /// @param cycle_id The id of the cycle to check against.
      ///
      CycleIsNth(int cycle_id)
         : CycleIsNth(DelegateConstruction{}, cycle_id)
      {}
   
   private:
      
      class Assertion : public _Assertion {
      
         public:
         
            Assertion(int cycle_id) : cycle_id_(cycle_id) {}

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << "Is " << cycle_id_ << ". cycle";
            }

            virtual void describeState(const char *add_indent = "") const {
               driver_->log() << add_indent << "Is " << driver_->getCycleId() << ". cycle";
            }
         
         private:

            virtual bool evalInternal() override {
               return driver_->getCycleId() == cycle_id_;
            }
            
         private:
            
            int cycle_id_ = -1;
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(CycleIsNth)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
