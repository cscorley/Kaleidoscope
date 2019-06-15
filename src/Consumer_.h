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
   
   class Consumer_ {
      
      public:
         
         virtual ~Consumer_() {}
         
         virtual void onFirmwareId(const char *firmware_id) {}
         virtual void onStartCycle(uint32_t cycle_id, uint32_t cycle_start_time) {}
         virtual void onEndCycle(uint32_t cycle_id, uint32_t cycle_end_time) {}
         virtual void onKeyPressed(uint8_t row, uint8_t col) {}
         virtual void onKeyReleased(uint8_t row, uint8_t col) {}
         virtual void onHIDReport(uint8_t id, int length, const uint8_t *data) {}
         virtual void onSetTime(uint32_t time) {}
         
   };
} // namespace aglais
