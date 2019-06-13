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

#include <vector>

namespace kaleidoscope {
namespace simulator {
namespace assertions {
   
/// @brief Groups multiple assertions.
/// @details The Grouped assertion only passes if all of its members pass.
///
template<typename _AssertionType>
class Grouped {
   
   public:
      
      /// @brief Constructor.
      /// @tparam assertion_ptrs A list of assertions to group.
      ///
      template<typename..._Assertions>
      Grouped(_Assertions...assertions)
         :  Grouped(DelegateConstruction{}, std::forward<_Assertions>(assertions)...)
      {}
 
   private:
      
      class Assertion : public _AssertionType {
         
         public:

            template<typename..._Assertions>
            Assertion(_Assertions...assertions)
               :  assertions_{std::forward<_Assertions>(assertions)...}
            {}

            virtual void report(const char *add_indent = "") const override {
               simulator_->log() << add_indent << "Assertion group:";
               std::string indent = std::string(add_indent) + "   ";
               for(const auto &assertion: assertions_) {
                  assertion->report(indent.c_str());
               }
            }

            virtual void setDriver(const Simulator *simulator) override {
               this->Assertion_::setDriver(simulator);
               
               for(auto &assertion: assertions_) {
                  assertion->setDriver(simulator);
               }
            }

            virtual void describe(const char *add_indent = "") const override {
               simulator_->log() << "A group of assertions";
            }

            virtual void describeState(const char *add_indent = "") const override {
               if(valid_) {
                  simulator_->log() << add_indent << "Assertion group valid";
                  return;
               }
               else {
                  simulator_->log() << add_indent << "Assertion group failed";
               }
               std::string indent = std::string(add_indent) + "   ";
               for(auto &assertion: assertions_) {
                  if(!assertion->isValid()) {
                     assertion->describeState(indent.c_str());
                  }
               }
            }

            virtual void setReport(const typename _AssertionType::ReportType *report) override {
               for(auto &assertion: assertions_) {
                  assertion->setReport(report);
               }
            }
            
         private:
            
            // Bring the parent class's simulator_ member into scope
            //
            using _AssertionType::simulator_;
            using _AssertionType::valid_;

            virtual bool evalInternal() override {
               valid_ = true;
               
               for(auto &assertion: assertions_) {
                  valid_ &= assertion->eval();
               }
               
               return valid_;
            }
            
         private:
            
            std::vector<std::shared_ptr<_AssertionType>> assertions_;
      };
      
   KT_AUTO_DEFINE_ASSERTION_INVENTORY(Grouped)
};

template<typename _Assertion, typename..._MoreAssertions>
Grouped<_Assertion> group(_Assertion &&assertion,
                          _MoreAssertions...more_assertions) {
   return Grouped<_Assertion>{std::forward<_Assertion>(assertion),
                              std::forward<_MoreAssertions>(more_assertions)...};
}

} // namespace assertions
} // namespace simulator
} // namespace kaleidoscope
