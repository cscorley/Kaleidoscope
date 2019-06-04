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
   
/** class CycleIsNth
 *  brief Asserts that the current cycle is the nth.
 */
class CycleIsNth {
   
   private:
      
      class Assertion : public _Assertion {
      
         public:
         
            Assertion(int cycle_id) : cycle_id_(cycle_id) {}

            virtual void describe(std::ostream &out, const char *add_indent = "") const override {
               out << add_indent << "Is " << cycle_id_ << ". cycle";
            }

            virtual void describeState(std::ostream &out, const char *add_indent = "") const {
               this->describe(out, add_indent);
            }
         
         private:

            virtual bool evalInternal() override {
               return test_driver_->getCycleId() == cycle_id_;
            }
            
         private:
            
            int cycle_id_ = -1;
      };
   
   KS_TESTING_ASSERTION_WRAPPER(CycleIsNth)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
