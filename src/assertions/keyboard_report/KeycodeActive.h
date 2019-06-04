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

namespace kaleidoscope {
namespace testing {
namespace assertions {

/** class KeycodeActive
 *  brief Asserts that a specific key is active in the keyboard report.
 */
class KeycodeActive {
   
   private:
      
      class Assertion : public _Assertion {
            
         public:
      
            Assertion(uint8_t keycode) 
               : keycode_(keycode) {}
               
            Assertion(Key key) 
               : keycode_(key.keyCode) {}

            virtual void describe(std::ostream &out, const char *add_indent = "") const override {
               out << add_indent << "Key " << keycodes::keycodeToName(keycode_) << " active";
            }

            virtual void describeState(std::ostream &out, const char *add_indent = "") const {
               out << add_indent << "Key " << keycodes::keycodeToName(keycode_) << " active: "
                  << test_driver_->getCurrentKeyboardReport().isKeycodeActive(keycode_);
            }

            virtual bool evalInternal() override {
               return test_driver_->getCurrentKeyboardReport().isKeycodeActive(keycode_);
            }
            
         private:
            
            uint8_t keycode_ = 255;  
      };
      
   KS_TESTING_ASSERTION_WRAPPER(KeycodeActive)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
