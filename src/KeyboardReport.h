/* -*- mode: c++ -*-
 * Kaleidoscope-Testing -- A C++ testing API for the Kaleidoscope keyboard 
 *                         firmware.
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

#include <vector>

namespace kaleidoscope {
namespace testing {
  
/** class KeyboardReport
 *  brief An interface to query keyboard reports.
 */
class KeyboardReport {
   
   public:
      
      bool isKeycodeActive(uint8_t k) const;
      bool isKeyActive(const Key_ &k) const;
      std::vector<uint8_t> getActiveKeycodes() const;
      
      bool isModifierKeycodeActive(uint8_t modifier) const;
      bool isModifierActive(const Key &key) const;
      
      bool isAnyModifierActive() const;
      bool isAnyKeyActive() const;
      
      std::vector<uint8_t> getActiveModifiers() const;
      
      bool isEmpty() const;
      
      void dump(std::ostream &out, const char *add_indent = "") const;
      
      void setReportData(const HID_KeyboardReport_Data_t &reportData);
      
   private:
   
      HID_KeyboardReport_Data_t reportData_;
};

} // namespace testing
} // namespace kaleidoscope
