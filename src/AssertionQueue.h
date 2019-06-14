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
#include "aux/demangle.h"

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
      ///
      AssertionQueue(Simulator &simulator) 
         :  simulator_(simulator)
      {}
      
      /// @brief Queues assertions.
      ///
      /// @param assertions The assertions to be added to the queue.
      ///
      ThisType &add(const std::vector<std::shared_ptr<_AssertionType>> &assertions);
      
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
      ThisType &addGrouped(const std::vector<std::shared_ptr<_AssertionType>> &assertions);
      
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
      ThisType &remove(const std::shared_ptr<_AssertionType> &assertion);
      
      /// @brief Removes a list of assertions.
      ///
      /// @param assertions The assertions to be removed from the queue.
      /// 
      ThisType &remove(const std::vector<std::shared_ptr<_AssertionType>> &assertions);
      
      /// @brief Removes the assertion at the head of the queue and returns it.
      ///
      /// @returns The former front element of the queue.
      ///
      std::shared_ptr<_AssertionType> popFront();
      
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
      
      void configureAssertion(const std::shared_ptr<_AssertionType> &assertion);
      
      std::shared_ptr<_AssertionType> generateAssertionGroup(
            const std::vector<std::shared_ptr<_AssertionType>> &assertions);
      
   private:
      
      Simulator &simulator_;
      std::deque<std::shared_ptr<_AssertionType>> queue_;
};

} // namespace simulator
} // namespace kaleidoscope
