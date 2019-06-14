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

namespace kaleidoscope {
namespace simulator {
namespace assertions {

/// @brief Checks the number of overall reports.
/// @details Asserts that there was a specific number of reports 
///          generated since the assertion was instanciated.
///
template<typename _ReportType>
class NumOverallReportsGenerated {
   
   public:
      
      /// @brief Constructor.
      /// @param n_overall_reports The number of reports whose
      ///        generation is being asserted.
      ///
      NumOverallReportsGenerated(int n_overall_reports) 
         : NumOverallReportsGenerated(DelegateConstruction{}, n_overall_reports) 
      {}
         
   private:
      
      class Assertion : public Assertion_ {
      
         public:
            
            Assertion(int n_overall_reports) 
               : n_overall_reports_(n_overall_reports) {}

            virtual void describe(const char *add_indent = "") const override {
               this->getSimulator()->log() << add_indent << n_overall_reports_ << " overall " << _ReportType::typeString() << " reports expected";
            }

            virtual void describeState(const char *add_indent = "") const {
               this->getSimulator()->log() << add_indent << this->getSimulator()->getNumTypedOverallReports<_ReportType>() << " overall " << _ReportType::typeString() << " reports encountered";
            }

            virtual bool evalInternal() override {
               return this->getSimulator()->getNumTypedOverallReports<_ReportType>() == n_overall_reports_;
            }
            
         private:
            
            int n_overall_reports_ = -1;      
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY_TMPL(NumOverallReportsGenerated<_ReportType>)
};

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
