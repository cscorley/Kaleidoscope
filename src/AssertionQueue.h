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

#pragma once

// Undefine some macros that are defined by Arduino
#undef min
#undef max

#include <deque>
#include <vector>
#include <memory>

namespace kaleidoscope {
namespace testing {
   
class Simulator;
class _Assertion;
   
/// @brief An auxiliary class that represents a queue of assertion objects.
///
class AssertionQueue
{
   public:
      
      /// @brief Constructor.
      /// @param simulator The associated Simulator object.
      /// @param type_string The type of assertion queue (queued keyboard reports,
      ///        permanent keyboard reports, ...).
      ///
      AssertionQueue(Simulator &simulator, const char *type_string) 
         :  driver_(simulator),
            type_string_(type_string)
      {}
      
      /// @brief Queues assertions.
      ///
      /// @param assertions The assertions to be added to the queue.
      ///
      AssertionQueue &add(const std::vector<std::shared_ptr<_Assertion>> &assertions);
      
      /// @brief Queues assertions.
      ///
      /// @tparam assertions The assertions to be added to the queue.
      ///
      template<typename..._Assertions>
      AssertionQueue &add(_Assertions...assertions) {
         this->add(std::vector<std::shared_ptr<_Assertion>>{std::forward<_Assertions>(assertions)...});
         return *this;
      }
      
      /// @brief Queues a list of assertion.
      ///
      /// @param assertions The assertions to be added to the queue.
      ///
      AssertionQueue &addGrouped(const std::vector<std::shared_ptr<_Assertion>> &assertions);
      
      /// @brief Queues a list of assertion.
      ///
      /// @tparam assertions The assertions to be added to the queue.
      ///
      template<typename..._Assertions>
      AssertionQueue &addGrouped(_Assertions...assertions) {
         return this->addGrouped(
            std::vector<std::shared_ptr<_Assertion>>{std::forward<_Assertions>(assertions)...}
         );
      }
      
      /// @brief Removes an assertion.
      ///
      /// @param assertion The assertion to be removed from the queue.
      ///
      AssertionQueue &remove(const std::shared_ptr<_Assertion> &assertion);
      
      /// @brief Removes a list of assertions.
      ///
      /// @param assertions The assertions to be removed from the queue.
      /// 
      AssertionQueue &remove(const std::vector<std::shared_ptr<_Assertion>> &assertions);
      
      /// @brief Removes the assertion at the head of the queue and returns it.
      ///
      /// @returns The former front element of the queue.
      ///
      std::shared_ptr<_Assertion> popFront();
      
      /// @brief Retreives the number of entries in the queue.
      ///
      std::size_t size() const;
      
      /// @brief Checks the queue for being empty.
      ///
      /// @returns True if the queue is empty, false otherwise.
      ///
      bool empty() const;
      
      /// @brief Clear the entire queue.
      ///
      void clear();
      
      /// @brief Enables direct access to the undelying std::deque object.
      ///
      const std::deque<std::shared_ptr<_Assertion>> &directAccess() {
         return queue_;
      }
      
   private:
      
      void configureAssertion(const std::shared_ptr<_Assertion> &assertion);
      
      std::shared_ptr<_Assertion> generateAssertionGroup(
            const std::vector<std::shared_ptr<_Assertion>> &assertions);
      
   private:
      
      Simulator &driver_;
      std::deque<std::shared_ptr<_Assertion>> queue_;
      const char *type_string_ = nullptr;
};

} // namespace testing
} // namespace kaleidoscope
