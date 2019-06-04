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
   
/** class AssertLayerIsActive
 *  brief Asserts that a given layer is active (the current top layer).
 */
class LayerIsActive {
   
   private:
      
      class Assertion : public _Assertion {
   
         public:
            
            Assertion(uint8_t layer_id) : layer_id_(layer_id) {}

            virtual void describe(std::ostream &out, const char *add_indent = "") const override {
               out << add_indent << "Layer " << layer_id_ << " expected to be active";
            }

            virtual void describeState(std::ostream &out, const char *add_indent = "") const {
               out << add_indent << "Layer " << layer_id_ << " is active: " << Layer.isActive(layer_id_);
            }

            virtual bool evalInternal() override {
               return Layer.isActive(layer_id_);
            }
            
         private:
            
            uint8_t layer_id_;
      };
   
   KS_TESTING_ASSERTION_WRAPPER(LayerIsActive)
};
   
} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
