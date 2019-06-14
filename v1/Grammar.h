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

// This is version 1 of the Aglais protocol
//
// Document grammar:
// 
// <command_string_XXX> ::= (character string version of command)
// <command_id_XXX> ::= (uint8_t id version of command)
// <XXX_cmd> ::= <command_string_XXX> | <command_id_XXX>
//
// <cycle_id> ::= (uint8_t)
// <time> ::= (uint16_t)
// <row> ::= (uint8_t)
// <col> ::= (uint8_t)
// <report_id> ::= (uint8_t)
// <data_length> ::= (uint8_t)
// <report_bytes> ::= (uint8_t)... (<data_length> times)
// <transfer_type> ::= (uint8_t)
// <protocol_version> ::= (uint8_t)
// <version_id> ::= (uint8_t)
// <id_string> ::= (double quoted string)
// <lbr> ::= '\n'
// <comment> ::= '#' (any characters except for '\n') <lbr>
// <start_time> ::= <time>
// <end_time> ::= <time>
// <start_cycle> ::= <start_cycle_cmd> <cycle_id> <start_time>
// <key_pressed> ::= <key_pressed_cmd> <row> <col>
// <key_released> ::= <key_released_cmd> <row> <col>
// <action_subcommand> ::= <key_pressed> | <key_released>
// <action> ::= <action_cmd> <action_subcommand>
// <keyboard_report> ::= <keyboard_report_cmd> <report_id> <data_length> <report_bytes>
// <reaction_subcommand> ::= <keyboard_report>
// <reaction> ::= <reaction_cmd> <reaction_subcommand>
// <end_cycle> ::= <end_cycle_cmd> <cycle_id> <end_time>
// <cycle_ar> ::= <action> | <reaction>
// <cycle_content> ::= <cycle_ar> | <cycle_ar> <lbr> <cycle_content>
// <cycle_long> ::= <cycle_start> <lbr> <cycle_content> <lbr> <cycle_end>
// <set_time> ::= <set_time_cmd> <time>
// <cycle_short> ::= <cycle_cmd> <cycle_id> 
// <cycle> ::= <cycle_short> | <cycle_long>
// <cycle_data> ::= <cycle> | <cycle> <lbr> <cycle_data> | <comment>
// <firmeware_id> ::= <firmeware_id_cmd> <id_string>
// <header_content> ::= <firmeware_id>
// <header> ::= <transfer_type> <protocol_version> <header_content>
// <document> ::= <header> <lbr> <cycle_data>

// The value of <transfer_type> defines whether string- or 
// id-versions of commands are used

namespace aglais {
namespace v1 {
   
#define AGLAIS_V1_COMMANDS(OP, SEP, TERM_SEP)                                  \
   OP(none, 0)SEP                                                              \
   OP(firmware_id, 2)SEP                                                       \
   OP(start_cycle, 3)SEP                                                       \
   OP(action, 4)SEP                                                            \
   OP(reaction, 5)SEP                                                          \
   OP(end_cycle, 6)SEP                                                         \
   OP(set_time, 7)SEP                                                          \
   OP(cycle, 8)TERM_SEP
   
#define AGLAIS_UINT8_T_STRUCT_DEF(NAME, ID)                                    \
   static constexpr uint8_t NAME = ID;
struct Command  {
   AGLAIS_V1_COMMANDS(AGLAIS_UINT8_T_STRUCT_DEF,,)
};

#define AGLAIS_V1_SUBCOMMANDS(OP, SEP, TERM_SEP)                               \
   OP(none, 0)SEP                                                              \
   OP(key_pressed, 1)SEP                                                       \
   OP(key_released, 2)SEP                                                      \
   OP(keyboard_report, 3)TERM_SEP

struct SubCommand {
   AGLAIS_V1_SUBCOMMANDS(AGLAIS_UINT8_T_STRUCT_DEF,,)
};
   
struct TransferType {
   static constexpr uint8_t none = 0;
   static constexpr uint8_t verbose = 1;
   static constexpr uint8_t compressed = 1;
};

constexpr uint8_t protocol_version = 1;

constexpr char comment_symbol = '#';
   
} // namespace V1
} // namespace aglais
