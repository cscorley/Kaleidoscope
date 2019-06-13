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

#include "assertions/Grouped.h"

// Undefine some macros that are defined by Arduino
#undef min
#undef max

#include <deque>
#include <vector>
#include <memory>

namespace kaleidoscope {
namespace simulator {
   
class Simulator;
   
/// @brief An auxiliary class that represents a queue of assertion objects.
///

template<typename _AssertionType>
class AssertionQueue
{
   public:
      
      typedef AssertionQueue<_AssertionType> ThisType;
      
      /// @brief Constructor.
      /// @param simulator The associated Simulator object.
      /// @param type_string The type of assertion queue (queued keyboard reports,
      ///        permanent keyboard reports, ...).
      ///
      AssertionQueue(Simulator &simulator, const char *type_string) 
         :  simulator_(simulator),
            type_string_(type_string)
      {}
      
      /// @brief Queues assertions.
      ///
      /// @param assertions The assertions to be added to the queue.
      ///
      ThisType &add(const std::vector<std::shared_ptr<_AssertionType>> &assertions) {
         for(auto &assertion: assertions) {
            this->configureAssertion(assertion);
            queue_.push_back(assertion);
            simulator_.log() << "Adding " << type_string_ << " assertion: " 
               << type(*assertion);
         }
         return *this;
      }
      
      /// @brief Queues assertions.
      ///
      /// @tparam assertions The assertions to be added to the queue.
      ///
      template<typename..._Assertions>
      ThisType &add(_Assertions...assertions) {
         this->add(std::vector<std::shared_ptr<_AssertionType>>{std::forward<_Assertions>(assertions)...});
         return *this;
      }
      
      /// @brief Queues a list of assertion.
      ///
      /// @param assertions The assertions to be added to the queue.
      ///
      ThisType &addGrouped(const std::vector<std::shared_ptr<_AssertionType>> &assertions) {
         queue_.push_back(
            this->generateAssertionGroup(assertions)
         );
         
         simulator_.log() << "Adding grouped " << type_string_ << " assertions";
         for(const auto &assertion: assertions) {
            simulator_.log() << "   " << type(*assertion);
         }   
         
         return *this;
      }
      
      /// @brief Queues a list of assertion.
      ///
      /// @tparam assertions The assertions to be added to the queue.
      ///
      template<typename..._Assertions>
      ThisType &addGrouped(_Assertions...assertions) {
         return this->addGrouped(
            std::vector<std::shared_ptr<_AssertionType>>{std::forward<_Assertions>(assertions)...}
         );
      }
      
      /// @brief Removes an assertion.
      ///
      /// @param assertion The assertion to be removed from the queue.
      ///
      ThisType &remove(const std::shared_ptr<_AssertionType> &assertion) {
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
            simulator_.log() << "Removed " << type_string_ << " assertion: " 
               << type(*assertion);
         }
         else {
            simulator_.error() << "Failed to remove " << type_string_ << " assertion: " 
               << type(*assertion);
         }
         return *this;
      }
      
      /// @brief Removes a list of assertions.
      ///
      /// @param assertions The assertions to be removed from the queue.
      /// 
      ThisType &remove(const std::vector<std::shared_ptr<_AssertionType>> &assertions) {
         for(auto &assertion: assertions) {
            this->remove(assertion);
         }
         return *this;
      }
      
      /// @brief Removes the assertion at the head of the queue and returns it.
      ///
      /// @returns The former front element of the queue.
      ///
      std::shared_ptr<_AssertionType> popFront() {
         auto front_element = queue_.front();
         queue_.pop_front();
         return front_element;
      }
      
      /// @brief Retreives the number of entries in the queue.
      ///
      std::size_t size() const {
         return queue_.size();
      }
      /// @brief Checks the queue for being empty.
      ///
      /// @returns True if the queue is empty, false otherwise.
      ///
      bool empty() const { 
         return queue_.empty();
      }
      
      /// @brief Clear the entire queue.
      ///
      void clear() {
         queue_.clear();
      }
      
      /// @brief Enables direct access to the undelying std::deque object.
      ///
      const std::deque<std::shared_ptr<_AssertionType>> &directAccess() {
         return queue_;
      }
      
   private:
      
      void configureAssertion(const std::shared_ptr<_AssertionType> &assertion) {
         assertion->setDriver(&simulator_);
      }
      
      std::shared_ptr<_AssertionType> generateAssertionGroup(
            const std::vector<std::shared_ptr<_AssertionType>> &assertions) {
         for(auto &assertion: assertions) {
            this->configureAssertion(assertion);
         } 
         
         std::shared_ptr<_AssertionType> grouped_assertions = assertions::group(assertions);
         
         this->configureAssertion(grouped_assertions);
         
         return grouped_assertions;
      }
      
   private:
      
      Simulator &simulator_;
      std::deque<std::shared_ptr<_AssertionType>> queue_;
      const char *type_string_ = nullptr;
};

} // namespace simulator
} // namespace kaleidoscope
