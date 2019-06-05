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
   
/// @brief Asserts that a given layer is the current top layer.
///
class TopActiveLayerIs {
   
   private:
      
      class Assertion : public _Assertion {
   
         public:
            
            /// @brief Constructor.
            /// @param[in] layer_id The id of the layer to check as top active.
            ///
            Assertion(int layer_id) : layer_id_(layer_id) {}

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << "Top active layer is " << layer_id_;
            }

            virtual void describeState(const char *add_indent = "") const {
               driver_->log() << add_indent << "Top active layer is " << Layer.top();
            }

            virtual bool evalInternal() override {
               return Layer.top() == (uint8_t)layer_id_;
            }
            
         private:
            
            int layer_id_;
      };
   
   KT_ASSERTION_WRAPPER(TopActiveLayerIs)
};
   
} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
