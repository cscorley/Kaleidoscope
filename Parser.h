/* -*- mode: c++ -*-
 * Aglais
 *     -- A log protocol for keyboard I/O
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

#include <stdint.h>

namespace aglais {
   
class Consumer_;

class Parser {
   
   public:
      
      void parse(const char *program, Consumer_ &consumer);
      
   private:
      
      void parserError(const char *program, uint8_t line_id) const;
      
   private:
      
      uint8_t transfer_type = 0;
      uint8_t protocol_version_ = 0;
};
   
} // namespace aglais
