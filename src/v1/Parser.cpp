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

#include "aglais/src/Consumer_.h"
#include "aglais/src/v1/Parser.h"
#include "aglais/src/v1/Grammar.h"

#include <vector>
#include <map>
#include <exception>
#include <sstream>

namespace aglais {
namespace v1 {
   
#define COMMA ,
   
#define AGLAIS_V1_ARRAY_INIT(NAME, ID) #NAME
#define AGLAIS_V1_MAP_INIT(NAME, ID) { #NAME, ID}
   
const char *Parser::commandIdToString(uint8_t command_id)
{
   static const char *command_strings[] = {
      AGLAIS_V1_COMMANDS(AGLAIS_V1_ARRAY_INIT, COMMA,)
   };
   
   if(command_id >= sizeof(command_strings)) {
      return "";
   }
   
   return command_strings[command_id];
}

const char *Parser::subCommandIdToString(uint8_t sub_command_id)
{
   static const char *sub_command_strings[] = {
      AGLAIS_V1_SUBCOMMANDS(AGLAIS_V1_ARRAY_INIT, COMMA,)
   };
   
   if(sub_command_id >= sizeof(sub_command_strings)) {
      return "";
   }
   
   return sub_command_strings[sub_command_id];
}

uint8_t Parser::commandStringToId(const char *string)
{
   static const std::map<const char*, uint8_t> command_ids = {
      AGLAIS_V1_COMMANDS(AGLAIS_V1_MAP_INIT, COMMA,)
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
      AGLAIS_V1_SUBCOMMANDS(AGLAIS_V1_MAP_INIT, COMMA,)
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
   
   if(document_type_ == DocumentType::verbose) {
      static constexpr int buf_length = 1024;
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
   
   if(document_type_ == DocumentType::verbose) {
      static constexpr int buf_length = 1024;
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
         static constexpr int buf_length = 1024;
         char buffer[buf_length];
         line_stream.get(buffer, buf_length, '\"');
         line_stream.ignore();
         line_stream.get(buffer, buf_length, '\"');
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
      case SubCommand::hid_report:
         {
            uint8_t id = 255;
            uint8_t length = 0;
            line_stream >> id >> length;
            
            uint8_t data[255];
            for(uint8_t i = 0; i < length; ++i) {
               line_stream >> data[i];
            }
               
            consumer.onHIDReport(id, length, data);
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
            uint32_t cycle_id = 0;
            uint32_t start_time = 0;
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
            uint32_t cycle_id = 0;
            uint32_t end_time = 0;
            line_stream >> cycle_id >> end_time;
            consumer.onEndCycle(cycle_id, end_time);
         }
         break;
      case Command::set_time:  
         {
            uint32_t time = 0;
            line_stream >> time;
            consumer.onSetTime(time);
         }
         break;
      case Command::cycle:
         {
            uint32_t cycle_id = 0;
            uint32_t start_time = 0;
            uint32_t end_time = 0;
            line_stream >> cycle_id >> start_time >> end_time;
            consumer.onStartCycle(cycle_id, start_time);
            consumer.onStartCycle(cycle_id, end_time);
         }
         break;
      case Command::cycles:
         {
            uint32_t start_cycles_id = 0;
            uint32_t start_cycles_time = 0;
            uint16_t n_cycles = 0;
            line_stream >> start_cycles_id >> start_cycles_time >> n_cycles;
            
            uint16_t last_time_offset = 0;
            for(uint16_t i = 0; i < n_cycles; ++i) {
               uint32_t cycle_id = start_cycles_id + i;
               uint16_t time_offset = 0;
               line_stream >> time_offset;
               uint32_t start_time = start_cycles_time + last_time_offset;
               uint32_t end_time = start_cycles_time + time_offset;
               last_time_offset = time_offset;
               
               consumer.onStartCycle(cycle_id, start_time);
               consumer.onEndCycle(cycle_id, end_time);
            }
         }
         break;
      default:
         this->parserError();
   }
   
   return false;
}

bool Parser::readNextLine(std::istream &in, std::string &line)
{
   bool read_success = false;
   do {      
      if(!std::getline(in, line)) {
         return false;
      }
      ++line_id_;
      
      if(!line.empty() && (line[0] != comment_symbol)) {
         break;
      }         
   } while(1);
   
   return true;
}
   
void Parser::parse(std::istream &in, Consumer_ &consumer)
{
   std::string line;
   
   this->readNextLine(in, line);
   
   bool is_header_line = this->parseHeaderLine(line, consumer);
   
   if(!is_header_line) {
      this->parseBodyLine(line, consumer);
   }
   
   while(this->readNextLine(in, line)) {
      ++line_id_;
      this->parseBodyLine(line, consumer);
   }
}

class CompressionConsumer : public Consumer_ {
   
   public:
      
      CompressionConsumer(const Parser &parser, std::ostream &out)
         :  parser_(parser),
            out_(out)
      {}
      
      virtual void onFirmwareId(const char *firmware_id) override {
         this->outputCommand(Command::firmware_id);
         out_ << " \"" << firmware_id << "\"\n";
      }
      virtual void onStartCycle(uint32_t cycle_id, uint32_t cycle_start_time) override {
         last_cycle_id_ = cycle_id;
         last_cycle_start_time_ = cycle_start_time;
         cycle_content_encountered_ = false;
         
         if(cycle_end_offsets_.empty()) {
            cycles_start_time_ = cycle_start_time;
         }
      }
      virtual void onEndCycle(uint32_t cycle_id, uint32_t cycle_end_time) override {
         
         if(!cycle_content_encountered_) {
            cycle_end_offsets_.push_back((uint16_t)(cycle_end_time - cycles_start_time_));
         }
         else {
            this->outputCommand(Command::end_cycle);
            out_ << ' ' << cycle_id << ' ' << cycle_end_time;
         }
      }
      virtual void onKeyPressed(uint8_t row, uint8_t col) override {
         this->considerKeyAction(SubCommand::key_pressed, row, col);
      }
      virtual void onKeyReleased(uint8_t row, uint8_t col) override {
         this->considerKeyAction(SubCommand::key_released, row, col);
      }
      virtual void onHIDReport(uint8_t id, int length, const uint8_t *data) override {             
         this->flush();
         cycle_content_encountered_ = true;
         this->outputCommand(Command::action);
         out_ << ' ';
         this->outputSubCommand(SubCommand::hid_report);
         out_ << ' ' << id << ' ' << length;
         for(int i = 0; i < length; ++i) {
            out_ << data[i] << ' ';
         }
         out_ << '\n';
      }
      virtual void onSetTime(uint32_t time) override {
         this->outputCommand(Command::set_time);
         out_ << ' ' << time << '\n';
      }
      
   private:
      
      void considerKeyAction(uint8_t action_id, uint8_t row, uint8_t col) {
         this->flush();
         cycle_content_encountered_ = true;
         this->outputCommand(Command::action);
         out_ << ' ';
         this->outputSubCommand(action_id);
         out_ << ' ' << row << ' ' << col << '\n';
      }
      
      void outputCommand(uint8_t command_id) {
         switch(parser_.getDocumentType()) {
            case DocumentType::verbose:
               out_ << parser_.commandIdToString(command_id);
               break;
            case DocumentType::compressed:
               out_ << command_id;
               break;
            default:
            {
               std::ostringstream error_stream{};
               error_stream << "Error while compressing. Unknown transfer type " << parser_.getDocumentType();
               throw std::runtime_error(error_stream.str().c_str());
            }
         }
      }
      
      void outputSubCommand(uint8_t sub_command_id) {
         switch(parser_.getDocumentType()) {
            case DocumentType::verbose:
               out_ << parser_.subCommandIdToString(sub_command_id);
               break;
            case DocumentType::compressed:
               out_ << sub_command_id;
               break;
            default:
            {
               std::ostringstream error_stream{};
               error_stream << "Error while compressing. Unknown transfer type " << parser_.getDocumentType();
               throw std::runtime_error(error_stream.str().c_str());
            }
         }
      }
      
      void flush() {
         this->flushCompressedCycles();
         
         this->outputCommand(Command::start_cycle);
         out_ << ' ' << last_cycle_id_ << ' ' << last_cycle_start_time_ << '\n';
      }
      
      void flushCompressedCycles() {
         
         if(cycle_end_offsets_.empty()) {
            return;
         }
         
         this->outputCommand(Command::cycles);
         out_ << cycles_start_id_ << ' ' << cycles_start_time_ << ' '
            << cycle_end_offsets_.size() << ' ';
         for(const auto &end_offset: cycle_end_offsets_) {
            out_ << end_offset << ' ';
         }
         cycle_end_offsets_.clear();
      }
      
   private:
      
      const Parser &parser_;
      std::ostream &out_;
      
      bool cycle_content_encountered_ = false;
      uint32_t cycles_start_id_ = 0;
      uint32_t cycles_start_time_ = 0;
      uint32_t last_cycle_id_ = 0;
      uint32_t last_cycle_start_time_ = 0;
      std::vector<uint16_t> cycle_end_offsets_;
};

void Parser::compress(std::istream &in, std::ostream &out) {
   
   CompressionConsumer cc{*this, out};
   
   this->parse(in, cc);
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
