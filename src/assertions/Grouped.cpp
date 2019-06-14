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

#include "Grouped.h"
#include "Simulator.h"

namespace kaleidoscope {
namespace simulator {
namespace assertions {
   
void Grouped<ReportAssertion_>::Assertion::determineGroupType()
{
   auto report_type_ = assertions_[0]->getReportTypeId();
   
   for(const auto &assertion: assertions_) {
      
      auto new_type = assertion->getReportTypeId();
      
      if(new_type != GenericReportTypeId) {
         if(report_type_ == GenericReportTypeId) {
            report_type_ = new_type;
         }
         else if(report_type_ != new_type) {
            this->getSimulator()->error()
               << "Error grouping report assertions. Trying to group non-generic assertions of different type";
            assertions_.clear();
            report_type_ = GenericReportTypeId;
            break;
         }
      }
   }
}
} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
