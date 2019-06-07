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
#include "Simulator.h"

namespace kaleidoscope {
namespace testing {
namespace assertions {

/// @brief Asserts that there was a specific number of keyboard reports generated
///         within a specific scan cycle.
///
class CycleGeneratesNKeyboardReports {
   
   public:
      
      /// @brief Constructor.
      /// @param n_reports The number of reports that must have been
      ///        generated.
      ///
      CycleGeneratesNKeyboardReports(int n_reports) 
         : CycleGeneratesNKeyboardReports(DelegateConstruction{}, n_reports) 
      {}
   
   private:
      
      class Assertion : public _Assertion {
         
         public:

            Assertion(int n_reports) : n_reports_(n_reports) {}

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << n_reports_ << " keyboard reports expected in cycle";
            }

            virtual void describeState(const char *add_indent = "") const {
               driver_->log() << add_indent << driver_->getNumKeyboardReportsInCycle() << " keyboard reports encountered";
            }

            virtual bool evalInternal() override {
               return driver_->getNumKeyboardReportsInCycle() == n_reports_;
            }
            
         private:
            
            int n_reports_ = -1;      
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(CycleGeneratesNKeyboardReports)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
