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

#include "AssertionQueue.h"
#include "assertions/Group.h"

namespace kaleidoscope {
namespace testing {
   
AssertionQueue &AssertionQueue::add(const std::shared_ptr<_Assertion> &assertion)
{
   this->configureAssertion(assertion);
   queue_.push_back(assertion);
   return *this;
}
      
AssertionQueue &AssertionQueue::addGrouped(const std::vector<std::shared_ptr<_Assertion>> &assertions)
{
   queue_.push_back(
      this->generateAssertionGroup(assertions)
   );
   return *this;
}

std::shared_ptr<_Assertion> AssertionQueue::generateAssertionGroup(
      const std::vector<std::shared_ptr<_Assertion>> &assertions) 
{
   for(auto &assertion: assertions) {
      this->configureAssertion(assertion);
   } 
   
   std::shared_ptr<_Assertion> groupAssertion = assertions::Group{assertions};
   
   this->configureAssertion(groupAssertion);
   
   return groupAssertion;
}

AssertionQueue &AssertionQueue::remove(const std::shared_ptr<_Assertion> &assertion)
{
   for (auto iter = queue_.begin(); iter != queue_.end() ; ) {
     (*iter == assertion) ? iter = queue_.erase(iter) : ++iter;
   }
   return *this;
}

AssertionQueue &AssertionQueue::remove(const std::vector<std::shared_ptr<_Assertion>> &assertions)
{
   for(auto &assertion: assertions) {
      this->remove(assertion);
   }
   return *this;
}
 
void AssertionQueue::configureAssertion(const std::shared_ptr<_Assertion> &assertion) {
   assertion->setDriver(&driver_);
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

bool AssertionQueue::empty() const 
{ 
   return queue_.empty();
}

void AssertionQueue::clear() {
   queue_.clear();
}
 
} // namespace testing
} // namespace kaleidoscope
