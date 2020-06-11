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

#include "Aglais.h"
#include "aglais/v1/Parser.h"

#include <string.h>
#include <sstream>
#include <exception>

#define PARSER_ERROR(...)                                                      \
   {                                                                           \
      std::ostringstream o;                                                    \
      o << "Aglais parser error: " << __VA_ARGS__;                             \
      throw std::runtime_error{o.str()};                                       \
   }

namespace aglais {
   
void Aglais::determineDocumentVersion(std::istream &in) {
   
   std::string line;   

   if(!std::getline(in, line)) {
      PARSER_ERROR("Premature end of file after line " << line_id_)
   }
   ++line_id_;
   
   std::istringstream tt_in(line);
   tt_in >> protocol_version_ >> document_type_;
 
   if(protocol_version_ != 1) {
      PARSER_ERROR("Unknown protocol version " << (int)protocol_version_ << " recieved")
   }

   if(!(   (document_type_ == DocumentType::verbose)
        || (document_type_ == DocumentType::compressed)))
   {
      PARSER_ERROR("Unknown document type " << (int)document_type_ << " recieved")
   }
     
   AGLAIS_DEBUG("document type: " << document_type_
            << ", protocol version: " << protocol_version_)
}

void Aglais::parse(std::istream &in, Consumer_ &consumer)
{
   try {
      AGLAIS_DEBUG("Starting to parse")
      this->determineDocumentVersion(in);
      
      switch(protocol_version_) {
         case 1:
         {
            AGLAIS_DEBUG("Delegating to v1 parser")
            v1::Parser delegate_parser(*this, document_type_, line_id_);
            delegate_parser.parse(in, consumer);
         }
      }
   }
   catch(const std::runtime_error &e) {
      std::ostringstream o;
      o << "Aglais failed parsing document. " << e.what();
      throw std::runtime_error(o.str());
   }
}

void Aglais::parse(const char *document, Consumer_ &consumer)
{
   std::istringstream in(document);

   this->parse(in, consumer);
}

void Aglais::compress(std::istream &in, std::ostream &out) 
{
   try {
      AGLAIS_DEBUG("Starting compression")
      this->determineDocumentVersion(in);
      
      if(quote_lines_) {
         out << '"';
      }
      out << (int)protocol_version_ << ' ' << (int)output_document_type_;
      if(quote_lines_) {
         out << "\\n\"";
      }
      out << '\n';
      
      switch(protocol_version_) {
         case 1:
         {
            AGLAIS_DEBUG("Delegating to v1 parser")
            AGLAIS_DEBUG("debug: " << debug_)
            AGLAIS_DEBUG("output document type: " << (int)output_document_type_)
            v1::Parser delegate_parser(*this, document_type_, line_id_);
            delegate_parser.compress(in, out);
         }
      }
   }
   catch(const std::runtime_error &e) {
      std::ostringstream o;
      o << "Aglais failed compressing document. " << e.what();
      throw std::runtime_error(o.str());
   }
}

void Aglais::compress(const char *document, std::ostream &out) 
{
   std::istringstream in(document);
   
   this->compress(in, out);
}
   
} // namespace aglais

#endif
