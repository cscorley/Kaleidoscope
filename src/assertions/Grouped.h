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

#include "Simulator.h"
#include "assertions/Assertion_.h"
#include "assertions/generic_report/ReportAssertion.h"

#include <vector>

namespace kaleidoscope {
namespace simulator {
namespace assertions {
    
template<typename _AssertionType>
class GroupedAssertion_ : public _AssertionType {
   
   public:

      template<typename..._Assertions>
      GroupedAssertion_(_Assertions...assertions)
         :  assertions_{std::forward<_Assertions>(assertions)...}
      {}

      GroupedAssertion_(const std::vector<std::shared_ptr<_AssertionType>> &assertions)
         :  assertions_{assertions}
      {}

      virtual void report(const char *add_indent = "") const override {
         this->getSimulator()->log() << add_indent << "Assertion group:";
         std::string indent = std::string(add_indent) + "   ";
         for(const auto &assertion: assertions_) {
            assertion->report(indent.c_str());
         }
      }

      virtual void setSimulator(const Simulator *simulator) override {
         this->Assertion_::setSimulator(simulator);
         
         for(auto &assertion: assertions_) {
            assertion->setSimulator(simulator);
         }
      }

      virtual void describe(const char *add_indent = "") const override {
         this->getSimulator()->log() << "A group of assertions";
      }

      virtual void describeState(const char *add_indent = "") const override {
         if(valid_) {
            this->getSimulator()->log() << add_indent << "Assertion group valid";
            return;
         }
         else {
            this->getSimulator()->log() << add_indent << "Assertion group failed";
         }
         std::string indent = std::string(add_indent) + "   ";
         for(auto &assertion: assertions_) {
            if(!assertion->isValid()) {
               assertion->describeState(indent.c_str());
            }
         }
      }

      virtual void setReport(const Report_ *report) override {
         for(auto &assertion: assertions_) {
            assertion->setReport(report);
         }
      }
      
   private:
      
      // Bring the parent class's simulator_ member into scope
      //
      using _AssertionType::valid_;

      virtual bool evalInternal() override {
         valid_ = true;
         
         for(auto &assertion: assertions_) {
            valid_ &= assertion->eval();
         }
         
         return valid_;
      }
      
   protected:
      
      std::vector<std::shared_ptr<_AssertionType>> assertions_;
};

/// @brief Groups multiple assertions.
/// @details The Grouped assertion only passes if all of its members pass.
///
template<typename _AssertionType>
class Grouped
{
   public:
      
      /// @brief Constructor.
      /// @tparam assertion_ptrs A list of assertions to group.
      ///
      template<typename..._Assertions>
      Grouped(_Assertions...assertions)
         :  Grouped<_AssertionType>(DelegateConstruction{}, std::forward<_Assertions>(assertions)...)
      {}
      
      Grouped(const std::vector<std::shared_ptr<_AssertionType>> &assertions)
         :  Grouped<_AssertionType>(DelegateConstruction{}, assertions)
      {}
      
   private:
      
      class Assertion : public GroupedAssertion_<_AssertionType> {
         
         public:
               
            template<typename..._Assertions>
            Assertion(_Assertions...assertions)
               :  GroupedAssertion_<_AssertionType>{std::forward<_Assertions>(assertions)...}
            {}
      };
      
   KT_AUTO_DEFINE_ASSERTION_INVENTORY_TMPL(Grouped<_AssertionType>)
};

template<>
class Grouped<ReportAssertion_>
{
   public:
      
      template<typename..._Assertions>
      Grouped(_Assertions...assertions)
         :  Grouped<ReportAssertion_>(DelegateConstruction{}, std::forward<_Assertions>(assertions)...)
      {}
      
      Grouped(const std::vector<std::shared_ptr<ReportAssertion_>> &assertions)
         :  Grouped<ReportAssertion_>(DelegateConstruction{}, assertions)
      {}
         
   private:
      
      class Assertion : public GroupedAssertion_<ReportAssertion_> 
      {
         public:
                 
            template<typename..._Assertions>
            Assertion(_Assertions...assertions)
               :  GroupedAssertion_<ReportAssertion_>{std::forward<_Assertions>(assertions)...}
            {
               this->determineGroupType();
            }
            
            virtual uint8_t getReportTypeId() const { return report_type_; }

         private:
      
            void determineGroupType();
            
         private:
            
            uint8_t report_type_ = GenericReportTypeId;
      };
      
   KT_AUTO_DEFINE_ASSERTION_INVENTORY_TMPL(Grouped<ReportAssertion_>)
};

template<typename..._MoreAssertions>
Grouped<Assertion_> group(const std::shared_ptr<Assertion_> &assertion,
                          _MoreAssertions...more_assertions) {
   return Grouped<Assertion_>{assertion,
                              std::forward<_MoreAssertions>(more_assertions)...};
}

template<typename..._MoreAssertions>
Grouped<ReportAssertion_> group(const std::shared_ptr<ReportAssertion_> &assertion,
                          _MoreAssertions...more_assertions) {
   return Grouped<ReportAssertion_>{assertion,
                              std::forward<_MoreAssertions>(more_assertions)...};
}

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
