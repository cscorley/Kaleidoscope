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
#include "assertions/Grouped.h"
#include "aux/demangle.h"

// Undefine some macros that are defined by Arduino
#undef min
#undef max

#include <deque>
#include <vector>
#include <memory>

namespace kaleidoscope {
namespace simulator {

template<typename _AssertionType>
AssertionQueue<_AssertionType> &
   AssertionQueue<_AssertionType>
      ::add(const std::vector<std::shared_ptr<_AssertionType>> &assertions) 
{
   for(auto &assertion: assertions) {
      this->configureAssertion(assertion);
      queue_.push_back(assertion);
      simulator_.log() << "Adding " << _AssertionType::typeString() << " assertion: " 
         << type(*assertion);
   }
   return *this;
}

template<typename _AssertionType>
AssertionQueue<_AssertionType> &
   AssertionQueue<_AssertionType>
      ::addGrouped(const std::vector<std::shared_ptr<_AssertionType>> &assertions)
{
   queue_.push_back(
      this->generateAssertionGroup(assertions)
   );
   
   simulator_.log() << "Adding grouped " << _AssertionType::typeString() << " assertions";
   for(const auto &assertion: assertions) {
      simulator_.log() << "   " << type(*assertion);
   }   
   
   return *this;
}

template<typename _AssertionType>
AssertionQueue<_AssertionType> &
   AssertionQueue<_AssertionType>
      ::remove(const std::shared_ptr<_AssertionType> &assertion)
{
   bool remove_success = false;
   
   for (auto iter = queue_.begin(); iter != queue_.end() ; ) {
   if(*iter == assertion) {
      iter = queue_.erase(iter);
      remove_success = true;
      break;
   }
   else {
      ++iter;
   }
   }
   if(remove_success) {
      simulator_.log() << "Removed " << _AssertionType::typeString() << " assertion: " 
         << type(*assertion);
   }
   else {
      simulator_.error() << "Failed to remove " << _AssertionType::typeString() << " assertion: " 
         << type(*assertion);
   }
   return *this;
}

template<typename _AssertionType>
AssertionQueue<_AssertionType> &
   AssertionQueue<_AssertionType>
      ::remove(const std::vector<std::shared_ptr<_AssertionType>> &assertions)
{
   for(auto &assertion: assertions) {
      this->remove(assertion);
   }
   return *this;
}

template<typename _AssertionType>
std::shared_ptr<_AssertionType> 
   AssertionQueue<_AssertionType>
      ::popFront()
{
   auto front_element = queue_.front();
   queue_.pop_front();
   return front_element;
}

template<typename _AssertionType>
void 
   AssertionQueue<_AssertionType>
      ::configureAssertion(const std::shared_ptr<_AssertionType> &assertion)
{
   assertion->setSimulator(&simulator_);
}

template<typename _AssertionType>
std::shared_ptr<_AssertionType>
   AssertionQueue<_AssertionType>
      ::generateAssertionGroup(
      const std::vector<std::shared_ptr<_AssertionType>> &assertions)
{
   for(auto &assertion: assertions) {
      this->configureAssertion(assertion);
   } 
   
   std::shared_ptr<_AssertionType> grouped_assertions 
      = std::static_pointer_cast<_AssertionType>(
         assertions::Grouped<_AssertionType>{assertions}.ptr()
      );
   
   this->configureAssertion(grouped_assertions);
   
   return grouped_assertions;
}

} // namespace simulator
} // namespace kaleidoscope
