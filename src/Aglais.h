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
   
struct DocumentType {
   static constexpr uint8_t none = 0;
   static constexpr uint8_t verbose = 1;
   static constexpr uint8_t compressed = 2;
};

} //namespace aglais

#ifdef KALEIDOSCOPE_VIRTUAL_BUILD

#include <istream>
#include <ostream>
#include <iostream>

#define AGLAIS_DEBUG(...)                                                      \
   if(debug_) {                                                                \
      std::cout << "aglais-debug: " << __VA_ARGS__ << std::endl;               \
   }

namespace aglais {
   
class Consumer_;

class Aglais {
   
   public:
      
      void parse(std::istream &in, Consumer_ &consumer);
      void parse(const char *document, Consumer_ &consumer);
      
      void compress(std::istream &in, std::ostream &out);
      void compress(const char *document, std::ostream &out);
      
      void setDebug(bool state = true) { debug_ = state; }
      
   private:
      
      void determineDocumentVersion(std::istream &in);
      
   private:
      
      int document_type_ = 0;
      int protocol_version_ = 0;
      int line_id_ = 0;
      bool debug_ = false;
};
   
} // namespace aglais

#endif

