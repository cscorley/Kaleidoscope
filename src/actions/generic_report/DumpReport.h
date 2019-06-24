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

#include "papilio/src/actions/generic_report/ReportAction.h"

namespace papilio {
namespace actions {

/// @brief Asserts nothing but dumps the current report instead.
///
class DumpReport {
   
   public:
      
      KT_ACTION_STD_CONSTRUCTOR(DumpReport)
   
   private:
      
      class Action : public ReportAction_ {
            
         public:

            virtual void describe(const char *add_indent = "") const override {
               this->getReport().dump(*this->getSimulator(), add_indent);
            }

            virtual void describeState(const char *add_indent = "") const {
               this->describe(add_indent);
            }

            virtual bool evalInternal() override {
               this->describe();
               return true;
            }

      };
   
   KT_AUTO_DEFINE_ACTION_INVENTORY(DumpReport)
};

} // namespace actions
} // namespace papilio
