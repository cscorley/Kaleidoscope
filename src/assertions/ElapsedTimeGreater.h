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
#include "Driver.h"

namespace kaleidoscope {
namespace testing {
namespace assertions {

/// @brief Asserts that that time that elapsed is greater than a given time in [ms].
///
class ElapsedTimeGreater {
   
   private:
      
      class Assertion : public _Assertion {
      
         public:
            
            /// @brief Constructor.
            /// @param delta_t The amount of time that is asserted being elapsed.
            /// @param start_t An optional start point in time as reference (defaults to zero).
            ///
            Assertion(Driver::TimeType delta_t, Driver::TimeType start_t = 0) 
               :  start_t_(start_t),
                  delta_t_(delta_t)
            {}
            
            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << "Time elapsed greater " << delta_t_ << " ms";
            }

            virtual void describeState(const char *add_indent = "") const {
               driver_->log() << add_indent << "Actual time elapsed " 
                  << driver_->getTime() << " ms";
            }

            virtual bool evalInternal() override {
               return driver_->getTime() - start_t_ > delta_t_;
            }
         
         private:
            
            Driver::TimeType start_t_ = .0;
            Driver::TimeType delta_t_ = .0;
      };
      
   KT_ASSERTION_WRAPPER(ElapsedTimeGreater)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
