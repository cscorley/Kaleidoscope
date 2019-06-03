/* -*- mode: c++ -*-
 * Kaleidoscope-Testing -- A C++ testing API for the Kaleidoscope keyboard 
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

#include "AssertionsQueue.h"

namespace kaleidoscope {
namespace testing {
   
void AssertionsQueue::queue(std::shared_ptr<_Assertion> &assertion)
{
   this->configureAssertion(assertion);
   queue_.push_back(assertion);
}
      
void AssertionsQueue::queueGrouped(std::vector<std::shared_ptr<_Assertion>> &assertions)
{
   queue_.push_back(
      this->generateAssertionGroup(assertions)
   );
}

std::shared_ptr<_Assertion> AssertionsQueue::generateAssertionGroup(
      std::vector<std::shared_ptr<_Assertion>> &assertions) {
   for(const auto &assertion: assertions) {
      this->configureAssertion(assertion);
   }
      
   assertions::Group group{assertions}; 
   this->configureAssertion(group);
   
   return group;
}

void AssertionQueue::remove(std::shared_ptr<_Assertion> &assertion)
{
   for (auto iter = deque_.begin(); iter != deque_.end() ; ) {
     (*iter == assertion) ? iter = deque_.erase(iter) : ++iter;
   }
}

void AssertionQueue::remove(std::vector<std::shared_ptr<_Assertion>> &assertions)
{
   for(auto &assertion: assertions) {
      this->remove(assertion);
   }
}
 
void AssertionQueue::configureAssertion(std::shared_ptr<_Assertion> &assertion) {
   assertion->setTestDriver(driver_);
}

std::shared_ptr<_Assertion> AssertionQueue::popFront()
{
   auto front_element = queue_.front();
   queue_.pop_front();
   return front_element;
}

std::size_t AssertionQueue::size() const
{
   return queue_.size();
}
 
} // namespace testing
} // namespace kaleidoscope
