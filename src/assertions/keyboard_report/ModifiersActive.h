/* -*- mode: c++ -*-
 * Kaleidoscope-Simulator -- A C++ testing API for the Kaleidoscope keyboard 
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

#include "assertions/generic_report/ReportAssertion.h"
#include "aux/keycodes.h"

#include "kaleidoscope/key_defs.h"

#include <algorithm>

namespace kaleidoscope {
namespace simulator {
namespace assertions {
   
inline
uint8_t toModifier(uint8_t modifier) { return modifier; }

inline
uint8_t toModifier(Key key) { return key.keyCode; }

/// @brief Asserts that a specific list of modifiers is active in the keyboard report.
///
class ModifiersActive {
   
   public:
      
      /// @brief Constructor.
      /// @param modifiers A list of modifier keycodes.
      /// @param exclusively If true only the listed modifiers may
      ///                  be part of the keyboard report for the
      ///                  assertion to pass.
      ///
      ModifiersActive(const std::vector<uint8_t> &modifiers, 
                  bool exclusively = false) 
         :  ModifiersActive(DelegateConstruction{}, modifiers, exclusively)
      {}
      
      /// @brief Constructor.
      /// @tparam key_info A list of key information values. Those
      ///        may be a mixture of keycodes or Key values.
      ///
      template<typename..._KeyInfo>
      ModifiersActive(_KeyInfo...key_info) 
         :  ModifiersActive(DelegateConstruction{}, std::forward<_KeyInfo>(key_info)...)
      {}
      
      /// @details After this was called, no other modifiers than the listed 
      ///          ones are allowed in the keyboard report for the
      ///          assertion to pass.
      ///
      void exclusively() { assertion_->setExclusively(true); }
      
   private:
      
      class Assertion : public ReportAssertion<KeyboardReport> {
   
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
               this->getSimulator()->log() << add_indent << "Modifiers active: ";
               
               if(modifiers_.empty()) {
                  this->getSimulator()->log() << "<none>";
                  return;
               }
               
               for(auto modifier: modifiers_) {
                  this->getSimulator()->log() << keycodes::keycodeToName(modifier) << " ";
               }
            }

            virtual void describeState(const char *add_indent = "") const {
               
               this->getSimulator()->log() << add_indent << "Modifiers actually active: ";
               
               auto active_modifiers = this->getReport().getActiveModifiers();
                              
               if(active_modifiers.empty()) {
                  this->getSimulator()->log() << "<none>";
                  return;
               }
               for(auto modifier: active_modifiers) {
                  this->getSimulator()->log() << keycodes::keycodeToName(modifier) << " ";
               }
            }

            virtual bool evalInternal() override {
               
               for(auto modifier: modifiers_) {
                  if(!this->getReport().isModifierKeycodeActive(modifier)) {
                     return false;
                  }
               }
                  
               if(exclusively_) {
                  
                  auto active_modifiers = this->getReport().getActiveModifiers();
               
                  for(auto modifier: active_modifiers) {
                     
                     if(std::find(modifiers_.begin(), modifiers_.end(), modifier) == modifiers_.end()) {
                        return false;
                     }
                  }
               }
               
               return true;
            }
            
            /// @brief Set exclusivity of the modifiers allowed in the keyboard
            ///        report.
            /// @param state The exclusivity state.
            ///
            void setExclusively(bool state) { exclusively_ = state; }
            
            /// @brief Retreives the state of exclusivity of modifiers in the  
            ///        keyboard report.
            /// @return [bool] The exclusivity state.
            ///
            bool getExclusively() const { return exclusively_; }
            
         private:
            
            std::vector<uint8_t> modifiers_;
            bool exclusively_ = false;
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(ModifiersActive)
};

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
