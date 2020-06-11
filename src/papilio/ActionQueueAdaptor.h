/* -*- mode: c++ -*-
 * Papilio - A keyboard simulation framework 
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


namespace papilio {
   
/// @brief An adaptor template that restricts access to 
///        action containers.
/// @details The adaptor provides the necessary access method
///        of a typical queue container.
///
template<typename _ContainerType>
class ActionQueueAdaptor
{
   public:
      
      typedef typename _ContainerType::ActionType ActionType;
      typedef ActionQueueAdaptor<_ContainerType> ThisType;
      
      ActionQueueAdaptor(_ContainerType &container)
         :  container_{container}
      {}
      
      /// @brief Queues actions.
      ///
      /// @param actions The actions to be added to the queue.
      ///
      ThisType &queue(const std::vector<std::shared_ptr<ActionType>> &actions) {
         container_.add(actions);
         return *this;
      }
         
      
      /// @brief Queues actions.
      ///
      /// @tparam actions The actions to be added to the queue.
      ///
      template<typename..._Actions>
      ThisType &queue(_Actions...actions) {
         container_.add(
            std::vector<std::shared_ptr<ActionType>>{
               unwrapAction(actions)...
            }
         );
         return *this;
      }
      
      /// @brief Queues a list of action.
      ///
      /// @param actions The actions to be added to the queue.
      ///
      ThisType &queueGrouped(const std::vector<std::shared_ptr<ActionType>> &actions) {
         container_.addGrouped(actions);
         return *this;
      }
      
      /// @brief Queues a list of action.
      ///
      /// @tparam actions The actions to be added to the queue.
      ///
      template<typename..._Actions>
      ThisType &queueGrouped(_Actions...actions) {
         container_.addGrouped(
            std::vector<std::shared_ptr<ActionType>>{
               unwrapAction(actions)...
            }
         );
         return *this;
      }
      
      bool empty() const { return container_.empty(); }
      
   private:
      
      _ContainerType &container_;
};
   
} // namespace papilio
