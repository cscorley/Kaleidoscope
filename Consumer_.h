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

namespace aglais {
   
   class Consumer_ {
      
      public:
         
         virtual ~Consumer_() {}
         
         virtual onFirmwareId(const char *firmware_id) {}
         virtual onStartCycle(uint16_t cycle_id, uint16_t cycle_start_time) {}
         virtual onEndCycle(uint16_t cycle_id, uint16_t cycle_end_time) {}
         virtual onKeyPressed(uint8_t row, uint8_t col) {}
         virtual onKeyReleased(uint8_t row, uint8_t col) {}
         virtual onKeyboardReport(uint8_t id, int length, const uint8_t *data) {}
         virtual onSetTime(uint16_t time) {}
         virtual onCycle(uint16_t cycle_id, uint16_t cycle_start_time, uint16_t cycle_end_time) {}
         
   };
} // namespace aglais
