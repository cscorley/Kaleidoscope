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

#include "kaleidoscope/key_defs.h"

#include <algorithm>

namespace kaleidoscope {
namespace testing {
namespace assertions {
   
inline
uint8_t toModifier(uint8_t modifier) { return modifier; }

inline
uint8_t toModifier(Key key) { return key.keyCode; }

/** class ModifiersActive
 *  brief Asserts that a specific list of keys is active in the keyboard report.
 */
class ModifiersActive {
   
   private:
      
      class Assertion : public _Assertion {
   
         public:
      
            Assertion(const std::vector<uint8_t> &modifiers, 
                      bool exclusively = false) 
               :  modifiers_(modifiers),
                  exclusively_(exclusively) 
            {}
            
            template<typename..._KeyInfo>
            Assertion(_KeyInfo...key_info) 
               :  modifiers_{toModifier(std::forward<_KeyInfo>(key_info))...},
                  exclusively_(false) 
            {}

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << "Modifiers active: ";
               
               if(modifiers_.empty()) {
                  driver_->log() << "<none>";
                  return;
               }
               
               for(auto modifier: modifiers_) {
                  driver_->log() << keycodes::keycodeToName(modifier) << " ";
               }
            }

            virtual void describeState(const char *add_indent = "") const {
               
               driver_->log() << add_indent << "Modifiers actually active: ";
               
               auto active_modifiers = driver_->getCurrentKeyboardReport().getActiveModifiers();
                              
               if(active_modifiers.empty()) {
                  driver_->log() << "<none>";
                  return;
               }
               for(auto modifier: active_modifiers) {
                  driver_->log() << keycodes::keycodeToName(modifier) << " ";
               }
            }

            virtual bool evalInternal() override {
               
               for(auto modifier: modifiers_) {
                  if(!driver_->getCurrentKeyboardReport().isModifierActive(modifier)) {
                     return false;
                  }
               }
                  
               if(exclusively_) {
                  
                  auto active_modifiers = driver_->getCurrentKeyboardReport().getActiveModifiers();
               
                  for(auto modifier: active_modifiers) {
                     
                     if(std::find(modifiers_.begin(), modifiers_.end(), modifier) == modifiers_.end()) {
                        return false;
                     }
                  }
               }
               
               return true;
            }
            
         private:
            
            std::vector<uint8_t> modifiers_;
            bool exclusively_ = false;
      };
   
   KS_TESTING_ASSERTION_WRAPPER(ModifiersActive)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
