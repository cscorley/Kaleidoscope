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
   
/// @brief An auxiliary class that represents a container of assertion objects.
///
template<typename _AssertionType>
class AssertionContainer
{
   public:
      
      typedef AssertionContainer<_AssertionType> ThisType;
      typedef _AssertionType AssertionType;
      
      /// @brief Constructor.
      /// @param simulator The associated Simulator object.
      ///
      AssertionContainer(Simulator &simulator) 
         :  simulator_(simulator)
      {}
      
      /// @brief Adds assertions.
      ///
      /// @param assertions The assertions to be added to the container.
      ///
      ThisType &add(const std::vector<std::shared_ptr<_AssertionType>> &assertions);
      
      /// @brief Adds assertions.
      ///
      /// @tparam assertions The assertions to be added to the container.
      ///
      template<typename..._Assertions>
      ThisType &add(_Assertions...assertions) {
         this->add(std::vector<std::shared_ptr<_AssertionType>>{std::forward<_Assertions>(assertions)...});
         return *this;
      }
      
      /// @brief Adds a list of assertion.
      ///
      /// @param assertions The assertions to be added to the container.
      ///
      ThisType &addGrouped(const std::vector<std::shared_ptr<_AssertionType>> &assertions);
      
      /// @brief Adds a list of assertion.
      ///
      /// @tparam assertions The assertions to be added to the container.
      ///
      template<typename..._Assertions>
      ThisType &addGrouped(_Assertions...assertions) {
         return this->addGrouped(
            std::vector<std::shared_ptr<_AssertionType>>{std::forward<_Assertions>(assertions)...}
         );
      }
      
      /// @brief Removes an assertion.
      ///
      /// @param assertion The assertion to be removed from the container.
      ///
      ThisType &remove(const std::shared_ptr<_AssertionType> &assertion);
      
      /// @brief Removes a list of assertions.
      ///
      /// @param assertions The assertions to be removed from the container.
      /// 
      ThisType &remove(const std::vector<std::shared_ptr<_AssertionType>> &assertions);
      
      /// @brief Removes the assertion at the head of the container and returns it.
      ///
      /// @returns The former front element of the container.
      ///
      std::shared_ptr<_AssertionType> popFront();
      
      /// @brief Retreives the number of entries in the container.
      ///
      std::size_t size() const {
         return container_.size();
      }
      /// @brief Checks the container for being empty.
      ///
      /// @returns True if the container is empty, false otherwise.
      ///
      bool empty() const { 
         return container_.empty();
      }
      
      /// @brief Clear the entire container.
      ///
      void clear() {
         container_.clear();
      }
      
      /// @brief Enables direct access to the undelying std::deque object.
      ///
      const std::deque<std::shared_ptr<_AssertionType>> &directAccess() {
         return container_;
      }
      
   private:
      
      void configureAssertion(const std::shared_ptr<_AssertionType> &assertion);
      
      std::shared_ptr<_AssertionType> generateAssertionGroup(
            const std::vector<std::shared_ptr<_AssertionType>> &assertions);
      
   private:
      
      Simulator &simulator_;
      std::deque<std::shared_ptr<_AssertionType>> container_;
};

} // namespace simulator
} // namespace kaleidoscope
