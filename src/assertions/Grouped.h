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

#include "assertions/_Assertion.h"
#include "Simulator.h"

#include <vector>

namespace kaleidoscope {
namespace testing {
namespace assertions {
   
/// @brief Groups multiple assertions.
/// @details The Grouped assertion only passes if all of its members pass.
///
class Grouped {
   
   public:
      
      /// @brief Constructor.
      /// @tparam assertion_ptrs A list of assertions to group.
      ///
      template<typename..._Assertions>
      Grouped(_Assertions...assertions)
         :  Grouped(DelegateConstruction{}, std::forward<_Assertions>(assertions)...)
      {}
 
   private:
      
      class Assertion : public _Assertion {
         
         public:

            template<typename..._Assertions>
            Assertion(_Assertions...assertions)
               :  assertions_{std::forward<_Assertions>(assertions)...}
            {}

            virtual void report(const char *add_indent = "") const override;

            virtual void setDriver(const Simulator *simulator) override;

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << "A group of assertions";
            }

            virtual void describeState(const char *add_indent = "") const override;

         private:

            virtual bool evalInternal() override {
               valid_ = true;
               
               for(auto &assertion: assertions_) {
                  valid_ &= assertion->eval();
               }
               
               return valid_;
            }
            
         private:
            
            std::vector<std::shared_ptr<_Assertion>> assertions_;
      };
      
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(Grouped)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
