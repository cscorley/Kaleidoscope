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

#include "assertions/Assertion_.h"
#include "Simulator.h"

namespace kaleidoscope {
namespace simulator {
namespace assertions {

/// @brief Asserts that that time that elapsed is greater than a given time in [ms].
///
class ElapsedTimeGreater {
   
   public:
   
      /// @brief Constructor.
      /// @param delta_t The amount of time that is asserted being elapsed.
      /// @param start_t An optional start point in time as reference (defaults to zero).
      ///
      ElapsedTimeGreater(Simulator::TimeType delta_t, Simulator::TimeType start_t = 0) 
         :  ElapsedTimeGreater(DelegateConstruction{}, delta_t, start_t)
      {}
      
   private:
      
      class Assertion : public Assertion_ {
      
         public:

            Assertion(Simulator::TimeType delta_t, Simulator::TimeType start_t = 0) 
               :  start_t_(start_t),
                  delta_t_(delta_t)
            {}
            
            virtual void describe(const char *add_indent = "") const override {
               simulator_->log() << add_indent << "Time elapsed greater " << delta_t_ << " ms";
            }

            virtual void describeState(const char *add_indent = "") const {
               simulator_->log() << add_indent << "Actual time elapsed " 
                  << simulator_->getTime() << " ms";
            }

            virtual bool evalInternal() override {
               return simulator_->getTime() - start_t_ > delta_t_;
            }
         
         private:
            
            Simulator::TimeType start_t_ = .0;
            Simulator::TimeType delta_t_ = .0;
      };
      
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(ElapsedTimeGreater)
};

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
