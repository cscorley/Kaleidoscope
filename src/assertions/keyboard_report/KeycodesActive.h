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

namespace kaleidoscope {
namespace testing {
namespace assertions {
   
inline
uint8_t toKeycode(uint8_t keycode) { return keycode; }

inline
uint8_t toKeycode(Key key) { return key.keyCode; }

/// @brief Asserts that a specific set of keys is active in the keyboard report.
///
class KeycodesActive {
   
   public:
      
      /// @brief Constructor.
      ///
      /// @param keycodes A collection of keycodes.
      /// @param exclusively If enabled no other keys than the listed 
      ///                 ones must be part of the checked keyboard report.
      ///
      KeycodesActive(const std::vector<uint8_t> &keycodes, 
                  bool exclusively = false) 
         : KeycodesActive(DelegateConstruction{}, keycodes, exclusively)
      {}
      
      /// @brief Constructor.
      ///
      /// @tparam key_info A list of key information objects. This
      ///         can be a mixture of keycodes or Key specifications.
      ///
      template<typename..._KeyInfo>
      KeycodesActive(_KeyInfo...key_info) 
         : KeycodesActive(DelegateConstruction{}, std::forward<_KeyInfo>(key_info)...)
      {}
      
      /// @details After this was called, no other keys than the listed 
      ///          ones are allowed in the keyboard report for the
      ///          assertion to pass.
      ///
      void exclusively() { assertion_->setExclusively(true); }
   
   private:
      
      class Assertion : public _Assertion {
   
         public:
      
            Assertion(const std::vector<uint8_t> &keycodes, 
                      bool exclusively = false) 
               :  keycodes_(keycodes),
                  exclusively_(exclusively) 
            {}

            template<typename..._KeyInfo>
            Assertion(_KeyInfo...key_info) 
               :  keycodes_{toKeycode(std::forward<_KeyInfo>(key_info))...},
                  exclusively_(false) 
            {}

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << "Keycodes active: ";
               
               if(keycodes_.empty()) {
                  driver_->log() << "<none>";
                  return;
               }
               
               for(auto keycode: keycodes_) {
                  driver_->log() << keycodes::keycodeToName(keycode) << " ";
               }
            }

            virtual void describeState(const char *add_indent = "") const {
               
               driver_->log() << add_indent << "Keycodes actually active: ";
               
               auto active_keycodes = driver_->getCurrentKeyboardReport().getActiveKeycodes();
                              
               if(active_keycodes.empty()) {
                  driver_->log() << "<none>";
                  return;
               }
               for(auto keycode: active_keycodes) {
                  driver_->log() << keycodes::keycodeToName(keycode) << " ";
               }
            }

            virtual bool evalInternal() override {
               
               for(auto keycode: keycodes_) {
                  if(!driver_->getCurrentKeyboardReport().isKeycodeActive(keycode)) {
                     return false;
                  }
               }
                  
               if(exclusively_) {
                  
                  auto active_keycodes = driver_->getCurrentKeyboardReport().getActiveKeycodes();
               
                  for(auto keycode: active_keycodes) {
                     
                     if(std::find(keycodes_.begin(), keycodes_.end(), keycode) == keycodes_.end()) {
                        return false;
                     }
                  }
               }
               
               return true;
            }
            
            /// @brief Set exclusivity of the keycodes allowed in the keyboard
            ///        report.
            /// @param state The exclusivity state.
            ///
            void setExclusively(bool state) { exclusively_ = state; }
            
            /// @brief Retreives the state of exclusivity of keycodes in the  
            ///        keyboard report.
            /// @return [bool] The exclusivity state.
            ///
            bool getExclusively() const { return exclusively_; }
            
         private:
            
            std::vector<uint8_t> keycodes_;
            bool exclusively_ = false;
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(KeycodesActive)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
