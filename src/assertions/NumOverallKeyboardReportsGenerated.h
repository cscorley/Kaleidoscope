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

namespace kaleidoscope {
namespace testing {
namespace assertions {

/// @brief Checks the number of overall keyboard reports.
/// @details Asserts that there was a specific number of keyboard reports 
///          generated since the assertion was instanciated.
///
class NumOverallKeyboardReportsGenerated {
   
   public:
      
      /// @brief Constructor.
      /// @param n_overall_reports The number of reports whose
      ///        generation is being asserted.
      ///
      NumOverallKeyboardReportsGenerated(int n_overall_reports) 
         : NumOverallKeyboardReportsGenerated(DelegateConstruction{}, n_overall_reports) 
      {}
         
   private:
      
      class Assertion : public _Assertion {
      
         public:
            
            Assertion(int n_overall_reports) 
               : n_overall_reports_(n_overall_reports) {}

            virtual void describe(const char *add_indent = "") const override {
               driver_->log() << add_indent << n_overall_reports_ << " overall keyboard reports expected";
            }

            virtual void describeState(const char *add_indent = "") const {
               driver_->log() << add_indent << driver_->getNumOverallKeyboardReports() << " overall keyboard reports encountered";
            }

            virtual bool evalInternal() override {
               return driver_->getNumOverallKeyboardReports() == n_overall_reports_;
            }
            
         private:
            
            int n_overall_reports_ = -1;      
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(NumOverallKeyboardReportsGenerated)
};

} // namespace assertions
} // namespace testing
} // namespace kaleidoscope
