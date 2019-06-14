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

#include "assertions/generic_report/ReportAssertion.h"
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
      
      /// @brief Constructor.
      ///
      /// @param data The data of the report to compare with.
      ///
      ReportEquals(const void *data)
         : ReportEquals(DelegateConstruction{}, data)
      {}
   
   private:
      
      class Assertion : public ReportAssertion<_ReportType> {
   
         public:
            
            Assertion(const _ReportType &report)
               :  report_(report)
            {}
      
            Assertion(const void *data)
               :  report_(data)
            {}

            virtual void describe(const char *add_indent = "") const override {
               this->getSimulator()->log() << add_indent << "Report equals: ";
               report_.dump(*this->getSimulator(), add_indent);
            }

            virtual void describeState(const char *add_indent = "") const {
               
               this->getSimulator()->log() << add_indent << "Reports differ: ";
               this->getSimulator()->log() << add_indent << "expected: ";
               report_.dump(*this->getSimulator(), add_indent);
               this->getSimulator()->log() << add_indent << "actual: ";
               this->getReport().dump(*this->getSimulator(), add_indent);
            }

            virtual bool evalInternal() override {
               
               return this->getReport() == report_;
            }
            
         private:
            
            _ReportType report_;
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY_TMPL(ReportEquals<_ReportType>)
};

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
