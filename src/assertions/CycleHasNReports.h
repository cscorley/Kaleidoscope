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

/** class CycleHasNReports
 *  brief Asserts that there was a specific number of keyboard reports generated
          within a cycle.
 */
class CycleHasNReports {
   
   KS_TESTING_ASSERTION_WRAPPER(CycleHasNReports)
   
   private:
      
      class Assertion : public _Assertion {
         
         public:

            Assertion(int n_reports) : n_reports_(n_reports) {}

            virtual void describe(std::ostream, const char *add_indent = "") const override {
               out << add_indent << n_reports_ << " keyboard reports expected in cycle";
            }

            virtual void describeState(std::ostream &out, const char *add_indent = "") const {
               out << add_indent << test_driver_->getNKeyboardReportsInCycle() << " keyboard reports encountered";
            }

            virtual bool evalInternal() override {
               return test_driver_->getNKeyboardReportsInCycle() == n_reports_;
            }
            
         private:
            
            int n_reports_ = -1;      
      };
};

} // namespace testing
} // namespace kaleidoscope
