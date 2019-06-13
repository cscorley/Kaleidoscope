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

#include "AssertionQueue.h"
#include "assertions/ReportAssertion_.h"

#include <vector>
#include <functional>

namespace kaleidoscope {
namespace simulator {
   
class Simulator;
   
class AssertionQueueBundle_
{
   public:
      
      AssertionQueueBundle_(Simulator &simulator, const char *type_string)
         :  type_string_(type_string),
            simulator_(simulator)
      {}
      
   protected:
      
      void registerResult(bool result);
   
   protected:
      
      const char *type_string_ = nullptr;
      Simulator &simulator_;
      
      int n_reports_in_cycle_ = 0;
      int n_overall_reports_ = 0;
};
   
template<typename _ReportType>
class AssertionQueueBundle : public AssertionQueueBundle_
{
   public:
      
      typedef ReportAssertion_<_ReportType> AssertionType;
      
      AssertionQueueBundle(Simulator &simulator, const char *type_string)
         :  AssertionQueueBundle_(simulator, type_string),
            queued_assertions_(simulator, type_string),
            permanent_assertions_(simulator, type_string)
      {}
      
      AssertionQueue<AssertionType> &queued() {
         return queued_assertions_;
      }
      
      AssertionQueue<AssertionType> &permanent() {
         return queued_assertions_;
      }
      
      /// @brief Retreives the number of keyboard reports that were generated
      ///        in the current cycle.
      ///
      int getNumReportsInCycle() const {
         return n_reports_in_cycle_;
      }
      
      /// @brief Retreives the number of overall keyboard reports that were
      ///        generated since the start of testing.
      ///
      int getNumOverallReports() const {
         return n_overall_reports_;
      }
      
   private:
      
      void processReport(const _ReportType &report) {
         
         ++n_overall_reports_;
         ++n_reports_in_cycle_;
         
         simulator_.log() << "Processing " << type_string_ << " report "
               << n_overall_reports_
               << " (" << n_reports_in_cycle_ << ". in cycle "
               << simulator_.getCycleId() << ")";
                        
         auto n_assertions_queued = queued_assertions_.size();
         
         simulator_.log() << n_assertions_queued
            << " queued " << type_string_ << " report assertions";
         
         if(!queued_assertions_.empty()) {
            auto assertion = queued_assertions_.popFront();
            this->processKeyboardReportAssertion(assertion, report);
         }
            
         if(!permanent_assertions_.empty()) {
            
            simulator_.log() << permanent_assertions_.size()
               << " permanent " << type_string_ << " report assertions";
            
            for(auto &assertion: permanent_assertions_.directAccess()) {
               this->processKeyboardReportAssertion(assertion);
            }
         }
               
         if((n_assertions_queued == 0) && simulator_.getErrorIfReportWithoutQueuedAssertions()) {
            simulator_.error() << "Encountered a " << type_string_ << " report without assertions being queued";
         }
      }
      
      void processAssertion(const std::shared_ptr<AssertionType> &assertion, const _ReportType &report) {
         
         assertion->setReport(&report);
         
         bool assertion_passed = assertion->eval();
         
         if(!assertion_passed || simulator_.getDebug()) {
            assertion->report();
         }
         
         this->registerResult(assertion_passed);
         
         assertion->setReport(nullptr);
      }
      
   private:
      
      AssertionQueue<AssertionType> queued_assertions_;
      AssertionQueue<AssertionType> permanent_assertions_;
      
      friend class Simulator;
};
     
} // namespace simulator
} // namespace kaleidoscope
