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

/** class ElapsedTimeGreater
 *  brief Asserts that that time that elapsed is greater than a given time in [ms].
 */
class ElapsedTimeGreater {
   
   private:
      
      class Assertion : public _Assertion {
      
         public:
            
            Assertion(double start_t, double delta_t) 
               :  start_t_(start_t),
                  delta_t_(delta_t)
            {}
            
            virtual void describe(std::ostream &out, const char *add_indent = "") const override {
               out << add_indent << "Time elapsed greater " << delta_t_ << " ms";
            }

            virtual void describeState(std::ostream &out, const char *add_indent = "") const {
               out << add_indent << "Actual time elapsed " 
                  << test_driver_->getTime() << " ms";
            }

            virtual bool evalInternal() override {
               return test_driver_->getTime() - start_t_ > delta_t_;
            }
         
         private:
            
            double start_t_ = .0;
            double delta_t_ = .0;
      };
      
   KS_TESTING_ASSERTION_WRAPPER(ElapsedTimeGreater)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
