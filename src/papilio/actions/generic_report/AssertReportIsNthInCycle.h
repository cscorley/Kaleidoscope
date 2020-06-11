/* -*- mode: c++ -*-
 * Papilio - A keyboard simulation framework 
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

#include "papilio/actions/generic_report/ReportAction.h"

namespace papilio {
namespace actions {

/// @brief Asserts that the current report is the nth report in the current cycle.
///
class AssertReportIsNthInCycle {
   
   public:
      
      /// @brief Constructor.
      /// @param report_id The id of the report to check against.
      ///
      AssertReportIsNthInCycle(int report_id)
         : AssertReportIsNthInCycle(DelegateConstruction{}, report_id)
      {}
      
   private:
      
      class Action : public ReportAction_ {
            
         public:

            Action(int report_id) : report_id_(report_id) {}

            virtual void describe(const char *add_indent = "") const override {
               this->getSimulator()->log() << add_indent << "Report " << report_id_ << ". in cycle";
            }

            virtual void describeState(const char *add_indent = "") const {
               this->getSimulator()->log() << add_indent << "Report is " 
                  << this->getSimulator()->getNumReportsInCycle() << ". in cycle";
            }

            virtual bool evalInternal() override {
               return this->getSimulator()->getNumReportsInCycle() == report_id_;
            }
            
         private:
            
            int report_id_ = -1;
      };
   
   PAPILIO_AUTO_DEFINE_ACTION_INVENTORY(AssertReportIsNthInCycle)
};

} // namespace actions
} // namespace papilio
