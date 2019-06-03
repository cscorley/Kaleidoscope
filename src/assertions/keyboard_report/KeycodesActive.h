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
#include "aux/keycodes.h"

#include <key_defs.h>

namespace kaleidoscope {
namespace testing {
namespace keyboard_report {

/** class KeycodesActive
 *  brief Asserts that a specific list of keys is active in the keyboard report.
 */
class KeycodesActive {
   
   KS_TESTING_ASSERTION_WRAPPER(KeycodesActive)
   
   private:
      
      class Assertion : public _Assertion {
   
         public:
      
            Assertion(const std::vector<uint8_t> &keycodes, 
                      bool exclusively = false) 
               :  keycodes_(keycodes),
                  exclusively_(exclusively) 
            {}

            virtual void describe(std::ostream, const char *add_indent = "") const override {
               out << add_indent << "Keycodes active: ";
               
               if(keycodes_.empty()) {
                  out << "<none>";
                  return;
               }
               
               for(auto keycode: keycodes_) {
                  out << keycodes::keycodeToName(keycode) << " ";
               }
            }

            virtual void describeState(std::ostream &out, const char *add_indent = "") const {
               
               out << add_indent << "Keycodes actually active: ";
               
               auto active_keycodes = test_driver_->getCurrentKeyboardReport().getActiveKeycodes();
                              
               if(active_keycodes.empty()) {
                  out << "<none>";
                  return;
               }
               for(auto keycode: active_keycodes) {
                  out << keycodes::keycodeToName(keycode) << " ";
               }
            }

            virtual bool evalInternal() override {
               
               for(auto keycode: keycodes_) {
                  if(!test_driver_->getCurrentKeyboardReport().isKeycodeActive(keycode)) {
                     return false;
                  }
               }
                  
               if(exclusively_) {
                  
                  auto active_keycodes = test_driver_->getCurrentKeyboardReport().getActiveKeycodes();
               
                  for(auto keycode: active_keycodes) {
                     
                     if(std::find(keycodes_.begin(), keycodes_.end(), keycode) == vec.end()) {
                        return false;
                     }
                  }
               }
               
               return true;
            }
            
         private:
            
            std::vector<uint8_t> keycodes_;
            bool exclusively_ = false;
      };
};

} // namespace keyboard_report
} // namespace testing
} // namespace kaleidoscope
