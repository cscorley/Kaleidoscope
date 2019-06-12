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

#ifdef ARDUINO_VIRTUAL

#include "aglais/Parser.h"
#include "aglais/v1/Parser.h"

#include <string.h>
#include <sstream>
#include <exception>

namespace aglais {

void Parser::parse(const char *program, Consumer_ &consumer)
{
   std::istringstream in(program);
   std::string line;
   uint8_t line_id = 0;
   
   {
      if(!std::getline(in, line)) {
         this->parserError(program, line);
      }
      ++line_id;
      
      std::istringstream tt_in(line);
      tt_in >> transfer_type_ >> protocol_version_;

      if(transfer_type_ == TransferType::none) {
         this->parserError(program, line_id);
      }
      
      if(protocol_version_ == 0) {
         this->parserError(program, line_id);
      }
   }
   
   switch(protocol_version_) {
      case 1:
      {
         V1::Parser delegate_parser(transfer_type_, line_);
         delegate_parser.parse(in, consumer);
      }
   }
}

void Parser::parserError(const char *program, uint8_t line_id) const
{   
   std::ostringstream error_stream;
   error_stream << "Aglais parser error in line " << line_id;
   throw std::runtime_error(error_stream.str());
}

   
} // namespace aglais

#endif
