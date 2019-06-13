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

#include "assertions/ReportAssertion_.h"
#include "Simulator.h"

namespace kaleidoscope {
namespace simulator {
namespace assertions {

/// @brief Asserts that the current report equals another report.
///
template<typename _ReportType>
class ReportEquals {
   
   public:
      
      /// @brief Constructor.
      ///
      /// @param report The report to compare with.
      ///
      ReportEquals(const _ReportType &report)
         : ReportEquals(DelegateConstruction{}, report)
      {}
   
   private:
      
      class Assertion : public ReportAssertion_<_ReportType> {
   
         public:
      
            Assertion(const _ReportType &report)
               :  report_(report)
            {}

            virtual void describe(const char *add_indent = "") const override {
               simulator_->log() << add_indent << "Report equals: ";
               report_.dump(*simulator_, add_indent);
            }

            virtual void describeState(const char *add_indent = "") const {
               
               simulator_->log() << add_indent << "Reports differ: ";
               simulator_->log() << add_indent << "expected: ";
               report_.dump(*simulator_, add_indent);
               simulator_->log() << add_indent << "actual: ";
               this->getReport().dump(*simulator_, add_indent);
            }

            virtual bool evalInternal() override {
               
               return this->getReport() == report_;
            }
            
         private:
            
            _ReportType report_;
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(ReportEquals)
};

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
