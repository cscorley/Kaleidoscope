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

#ifdef KALEIDOSCOPE_VIRTUAL_BUILD

#include "aglais/src/Aglais.h"
#include "aglais/src/v1/Parser.h"

#include <string.h>
#include <sstream>
#include <exception>

namespace aglais {
   
void Aglais::determineDocumentVersion(std::istream &in) {
   
   std::string line;   
   {
      if(!std::getline(in, line)) {
         this->parserError();
      }
      ++line_id_;
      
      std::istringstream tt_in(line);
      tt_in >> transfer_type_ >> protocol_version_;

      if(transfer_type_ == DocumentType::none) {
         this->parserError();
      }
      
      if(protocol_version_ == 0) {
         this->parserError();
      }
   }
}

void Aglais::parse(std::istream &in, Consumer_ &consumer)
{
   this->determineDocumentVersion(in);
   
   switch(protocol_version_) {
      case 1:
      {
         v1::Parser delegate_parser(transfer_type_, line_id_);
         delegate_parser.parse(in, consumer);
      }
   }
}

void Aglais::parse(const char *document, Consumer_ &consumer)
{
   std::istringstream in(document);
 
   this->parse(in, consumer);
}

void Aglais::compress(std::istream &in, std::ostream &out) 
{
   this->determineDocumentVersion(in);
   
   switch(protocol_version_) {
      case 1:
      {
         v1::Parser delegate_parser(transfer_type_, line_id_);
         delegate_parser.compress(in, out);
      }
   }
}

void Aglais::compress(const char *document, std::ostream &out) 
{
   std::istringstream in(document);
   
   this->compress(in, out);
}

void Aglais::parserError() const
{   
   std::ostringstream error_stream;
   error_stream << "Aglais parser error in line " << line_id_;
   throw std::runtime_error(error_stream.str());
}

   
} // namespace aglais

#endif
