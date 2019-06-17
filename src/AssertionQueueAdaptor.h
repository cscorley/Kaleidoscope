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


namespace kaleidoscope {
namespace simulator {
   
/// @brief An adaptor template that restricts access to 
///        assertion containers.
/// @details The adaptor provides the necessary access method
///        of a typical queue container.
///
template<typename _ContainerType>
class AssertionQueueAdaptor
{
   public:
      
      typedef typename _ContainerType::AssertionType AssertionType;
      typedef AssertionQueueAdaptor<_ContainerType> ThisType;
      
      AssertionQueueAdaptor(_ContainerType &container)
         :  container_{container}
      {}
      
      /// @brief Queues assertions.
      ///
      /// @param assertions The assertions to be added to the queue.
      ///
      ThisType &queue(const std::vector<std::shared_ptr<AssertionType>> &assertions) {
         container_.add(assertions);
         return *this;
      }
         
      
      /// @brief Queues assertions.
      ///
      /// @tparam assertions The assertions to be added to the queue.
      ///
      template<typename..._Assertions>
      ThisType &queue(_Assertions...assertions) {
         container_.add(std::vector<std::shared_ptr<AssertionType>>{std::forward<_Assertions>(assertions)...});
         return *this;
      }
      
      /// @brief Queues a list of assertion.
      ///
      /// @param assertions The assertions to be added to the queue.
      ///
      ThisType &queueGrouped(const std::vector<std::shared_ptr<AssertionType>> &assertions) {
         container_.addGrouped(assertions);
         return *this;
      }
      
      /// @brief Queues a list of assertion.
      ///
      /// @tparam assertions The assertions to be added to the queue.
      ///
      template<typename..._Assertions>
      ThisType &queueGrouped(_Assertions...assertions) {
         container_.addGrouped(
            std::vector<std::shared_ptr<AssertionType>>{std::forward<_Assertions>(assertions)...}
         );
         return *this;
      }
      
      bool empty() const { return container_.empty(); }
      
   private:
      
      _ContainerType &container_;
};
   
} // namespace simulator
} // namespace kaleidoscope
