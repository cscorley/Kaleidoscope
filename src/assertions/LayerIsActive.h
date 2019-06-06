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

#include "kaleidoscope/layers.h"

namespace kaleidoscope {
namespace testing {
namespace assertions {
   
/// @brief Asserts that a given layer is active.
///
class LayerIsActive {
   
   public:
      
      /// @brief Constructor.
      /// @param layer_id The id of the layer that must be active for
      ///        the assertion to pass.
      ///
      LayerIsActive(int layer_id) 
         : LayerIsActive(DelegateConstruction{}, layer_id) 
      {}
   
   private:
      
      class Assertion : public _Assertion {
   
         public:

            Assertion(int layer_id) : layer_id_(layer_id) {}

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << "Layer " << layer_id_ << " expected to be active";
            }

            virtual void describeState(const char *add_indent = "") const {
               driver_->log() << add_indent << "Layer " << layer_id_ << " is active: " << Layer.isActive((uint8_t)layer_id_);
            }

            virtual bool evalInternal() override {
               return Layer.isActive((uint8_t)layer_id_);
            }
            
         private:
            
            int layer_id_;
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(LayerIsActive)
};
   
} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
