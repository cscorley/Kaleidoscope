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
#include "kaleidoscope/key_defs.h"

#include <functional>

namespace kaleidoscope {
namespace testing {
namespace assertions {

/// @brief Executes a lambda function of type bool(const Driver &, const KeyboardReport&).
/// @details The lambda must return true to signal that the assertion passed
///        and false otherwise.      
///
class CustomKeyboardReportAssertion {
   
   private:
      
      class Assertion : public _Assertion {
            
         public:
            
            /// @brief Constructor.
            /// @param func The function to evaluate as a condition for 
            ///        the assertion to pass.
            ///
            Assertion(const std::function<bool(const KeyboardReport&)> &func)
               : func_(func)
            {}

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << "Custom keyboard report assertion";
            }

            virtual void describeState(const char *add_indent = "") const {
               driver_->log() << add_indent << "Custom keyboard report assertion failed";
            }

            virtual bool evalInternal() override {
               return func_(driver_->getCurrentKeyboardReport());
            }
            
         private:
            
            std::function<bool(const KeyboardReport&)> func_;
      };
   
   KT_ASSERTION_WRAPPER(CustomKeyboardReportAssertion)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
