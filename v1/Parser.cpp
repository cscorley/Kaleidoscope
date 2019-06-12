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

#include "aglais/v1/Parser.h"

#include <map>
#include <exception>
#include <sstream>

namespace aglais {
namespace v1 {
   
#define AGLAIS_V1_ARRAY_INIT(NAME, ID) #NAME
#define AGLAIS_V1_MAP_INIT(NAME, ID) { #NAME, ID}
   
const char *Parser::commandIdToString(uint8_t command_id)
{
   static const char *command_strings[] = {
      AGLAIS_V1_COMMANDS(AGLAIS_V1_ARRAY_INIT)
   };
   
   if(command_id >= sizeof(command_strings)) {
      return "";
   }
   
   return command_strings[command_id];
}

const char *Parser::subCommandIdToString(uint8_t sub_command_id)
{
   static const char *sub_command_strings[] = {
      AGLAIS_V1_SUBCOMMANDS(AGLAIS_V1_ARRAY_INIT)
   };
   
   if(sub_command_id >= sizeof(sub_command_strings)) {
      return "";
   }
   
   return sub_command_strings[sub_command_id];
}

uint8_t Parser::commandStringToId(const char *string)
{
   static const std::map<const char*, uint8_t> command_ids = {
      AGLAIS_V1_COMMANDS(AGLAIS_V1_MAP_INIT)
   };
   
   auto it = command_ids.find(string);
   if(it == command_ids.end()) {
      return Command::none;
   }
   
   return it->second;
}

uint8_t Parser::subCommandStringToId(const char *string)
{
   static const std::map<const char*, uint8_t> sub_command_ids = {
      AGLAIS_V1_SUBCOMMANDS(AGLAIS_V1_MAP_INIT)
   };
   
   auto it = sub_command_ids.find(string);
   if(it == sub_command_ids.end()) {
      return SubCommand::none;
   }
   
   return it->second;
}

uint8_t Parser::readCommandId(std::istream &line_stream) const
{   
   uint8_t command_id = 0;
   
   if(transfer_type_ == TransferType::verbose) {
      static constexpr buf_length = 1024;
      char buffer[buf_length];
      
      line_stream.get(buffer, buf_length, ' ');
      
      command_id = this->commandStringToId(buffer);
   }
   else {
      line_stream >> command_id;
   }
      
   if(command_id == Command::none) {
      this->parserError();
   }
   
   return command_id;
}

uint8_t Parser::readSubCommandId(std::istream &line_stream) const 
{   
   uint8_t sub_command_id = 0;
   
   if(transfer_type_ == TransferType::verbose) {
      static constexpr buf_length = 1024;
      char buffer[buf_length];
      
      line_stream.get(buffer, buf_length, ' ');
      
      sub_command_id = this->subCommandStringToId(buffer);
   }
   else {
      line_stream >> sub_command_id;
   }
      
   if(sub_command_id == SubCommand::none) {
      this->parserError();
   }
   
   return sub_command_id;
}

bool Parser::parseHeaderLine(std::string &line, Consumer_ &consumer) const
{   
   std::istringstream line_stream(line);
   line_stream >> std::skipws;
   
   uint8_t command_id = this->readCommandId(line_stream);
   
   switch(command_id) {
      case Command::firmware_id:
      {
         std::string firmware_id;
         line_stream.get(buffer, buf_length, '\"');
         line_stream.skip();
         int n_read = line_stream.get(buffer, buf_length, '\"');
         buffer[n_read] = '\0';
         consumer.onFirmwareId(buffer);
         return true;
      }
   }
   
   return false;
}

void Parser::parseAction(std::istream &line_stream, Consumer_ &consumer) const
{   
   uint8_t sub_command_id = this->readSubCommandId(line_stream);
   
   uint8_t row = 255, col = 255;
   line_stream >> row >> col;
             
   switch(sub_command_id) {
      case SubCommand::key_pressed:
         {
             consumer.onKeyPressed(row, col);
         }
         break;
      case SubCommand::key_released:
         {
             consumer.onKeyReleased(row, col);
         }
         break;
      default:
         this->parserError();
   }
}

void Parser::parseReaction(std::istream &line_stream, Consumer_ &consumer) const
{   
   uint8_t sub_command_id = this->readSubCommandId(line_stream);
   
   switch(sub_command_id) {
      case SubCommand::keyboard_report:
         {
            uint8_t id = 255;
            uint8_t length = 0;
            line_stream >> id >> length;
            
            uint8_t data[255];
            for(uint8_t i = 0; i < length; ++i) {
               line_stream >> data[i];
            }
               
            consumer.onKeyboardReport(id, length, data);
         }
         break;
      default:
         this->parserError();
   }
}

bool Parser::parseBodyLine(std::string &line, Consumer_ &consumer) const 
{ 
   std::istringstream line_stream(line);
   line_stream >> std::skipws;
   
   uint8_t command_id = this->readCommandId(line_stream);
   
   switch(command_id) {
      case Command::start_cycle:
         {
            uint8_t cycle_id = 0;
            uint16_t start_time = 0;
            line_stream >> cycle_id >> start_time;
            consumer.onStartCycle(cycle_id, start_time);
         }
         break;
      case Command::action:
         this->parseAction(line_stream, consumer);
         break;
      case Command::reaction:
         this->parseReaction(line_stream, consumer);
         break;
      case Command::end_cycle:
         {
            uint8_t cycle_id = 0;
            uint16_t end_time = 0;
            line_stream >> cycle_id >> end_time;
            consumer.onEndCycle(cycle_id, end_time);
         }
         break;
      case Command::set_time:  
         {
            uint16_t time = 0;
            line_stream >> time;
            consumer.onSetTime(cycle_id, time);
         }
         break;
      case Command::cycle:
         {
            uint8_t cycle_id = 0;
            uint16_t start_time = 0;
            uint16_t end_time = 0;
            line_stream >> cycle_id >> start_time >> end_time;
            consumer.onCycle(cycle_id, start_time, end_time);
         }
         break;
      default:
         this->parserError();
   }
   
   return false;
   
void Parser::parse(std::istream &in, Consumer_ &consumer)
{
   std::string line;
   
   if(!std::getline(in, line)) {
      this->parserError();
   }
   ++line_id_;
   bool is_header_line = this->parseHeader(line, consumer);
   
   if(!is_header_line) {
      this->parseBodyLine(line, consumer);
   }
   
   while(std::getline(in, line)) {
      ++line_id_;
      this->parseBodyLine(line, consumer);
   }
}

void Parser::parserError() const
{
   std::ostringstream error_stream;
   error_stream << "Aglais parser error in line " << line_id_;
   throw std::runtime_error(error_stream.str());
}
   
} // namespace V1
} // namespace aglais

#endif
