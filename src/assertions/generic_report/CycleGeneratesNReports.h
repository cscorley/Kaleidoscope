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

/// @brief Asserts that there was a specific number of keyboard reports generated
///         within a specific scan cycle.
///
template<typename _ReportType>
class CycleGeneratesNReports {
   
   public:
      
      /// @brief Constructor.
      /// @param n_reports The number of reports that must have been
      ///        generated.
      ///
      CycleGeneratesNReports(int n_reports) 
         : CycleGeneratesNReports(DelegateConstruction{}, n_reports) 
      {}
   
   private:
      
      class Assertion : public Assertion_ {
         
         public:

            Assertion(int n_reports) : n_reports_(n_reports) {}

            virtual void describe(const char *add_indent = "") const override {
               this->getSimulator()->log() << add_indent << n_reports_ << " keyboard reports expected in cycle";
            }

            virtual void describeState(const char *add_indent = "") const {
               this->getSimulator()->log() << add_indent << this->getSimulator()->getNumTypedReportsInCycle<_ReportType>() << " keyboard reports encountered";
            }

            virtual bool evalInternal() override {
               return this->getSimulator()->getNumTypedReportsInCycle<_ReportType>() == n_reports_;
            }
            
         private:
            
            int n_reports_ = -1;      
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY_TMPL(CycleGeneratesNReports<_ReportType>)
};

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
