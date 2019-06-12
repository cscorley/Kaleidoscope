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

#ifdef ARDUINO_VIRTUAL
      
#include "aglais/v1/Grammar.h"

#include <string>
#include <istream>

namespace aglais {
namespace v1 {

class Parser {

   public:
      
      constexpr uint8_t protocol_version = aglais::V1::protocol_version;
      
      Parser(uint8_t transfer_type, int start_line_id) :
         :  transfer_type_(transfer_type),
            line_id_(start_line_id)
      {}
      
      static const char *commandIdToString(uint8_t command_id);
      static const char *subCommandIdToString(uint8_t sub_command_id);

      static uint8_t commandStringToId(const char *string);
      static uint8_t subCommandStringToId(const char *string);
      
      void parse(std::istream &in, Consumer_ &consumer);
   
   private:
      
      uint8_t readCommandId(std::istream &line_stream) const;
      uint8_t readSubCommandId(std::istream &line_stream) const;
      
      bool parseHeaderLine(std::string &line, Consumer_ &consumer) const;
      void parseAction(std::istream &line_stream, Consumer_ &consumer) const;
      void parseReaction(std::istream &line_stream, Consumer_ &consumer) const;
      bool parseBodyLine(std::string &line, Consumer_ &consumer) const;
      
      void parserError() const;
      
   private:
      
      uint8_t transfer_type_ = TransferType::none;
      int line_id_ = 0;
};
   
} // namespace V1
} // namespace aglais
