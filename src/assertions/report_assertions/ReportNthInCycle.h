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

namespace kaleidoscope {
namespace simulator {
namespace assertions {

/// @brief Asserts that the current report is the nth report in the current cycle.
///
template<typename _ReportType>
class ReportNthInCycle {
   
   public:
      
      /// @brief Constructor.
      /// @param report_id The id of the report to check against.
      ///
      ReportNthInCycle(int report_id)
         : ReportNthInCycle(DelegateConstruction{}, report_id)
      {}
      
   private:
      
      class Assertion : public ReportAssertion_<_ReportType> {
            
         public:

            Assertion(int report_id) : report_id_(report_id) {}

            virtual void describe(const char *add_indent = "") const override {
               simulator_->log() << add_indent << "Report " << report_id_ << ". in cycle";
            }

            virtual void describeState(const char *add_indent = "") const {
               simulator_->log() << add_indent << "Report is " 
                  << simulator_->getAssertionQueueBundle(Type2Type<_ReportType>{})
                     .getNumReportsInCycle() << ". in cycle";
            }

            virtual bool evalInternal() override {
               return simulator_->getAssertionQueueBundle(
                  Type2Type<ReportType>{}).getNumReportsInCycle() == report_id_;
            }
            
         private:
            
            int report_id_ = -1;
      };
   
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(ReportNthInCycle)
};

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
