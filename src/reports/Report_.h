/* -*- mode: c++ -*-
 * Papilio - A keyboard simulation framework 
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

namespace papilio {
   
class Simulator;

enum {
   AnyTypeReportType = 0,
   BootKeyboardReportType = 1,
   KeyboardReportType = 2,
   MouseReportType = 3,
   AbsoluteMouseReportType = 4
};
  
/// @brief A common base class for HID reports.
///
class Report_ {
   
   public:
      
      static constexpr uint8_t type_ = AnyTypeReportType;
      
      /// @brief Creates a copy of the report.
      /// @returns A pointer to the created copy.
      ///
      virtual std::shared_ptr<Report_> clone() const = 0;
      
      /// @brief Checks two reports for equality.
      /// @details If the two reports are of different type,
      ///        the equality check fails.
      /// @returns True if both reports are of same time and
      ///        identical content.
      ///
      virtual bool equals(const Report_ &other) const = 0;
      
      /// @brief Checks if the report is empty.
      /// @details Empty means neither key nor modifier keycodes are active.
      ///
      virtual bool isEmpty() const = 0;
      
      /// @brief Writes a formatted representation of the keyboard report 
      ///        to the simulator's log stream.
      /// @param add_indent An additional indentation string.
      ///
      virtual void dump(const Simulator &simulator, const char *add_indent = "") const = 0;
      
      static const char *typeString() { return "generic report"; }
      virtual const char *getTypeString() const { return typeString(); }
};

} // namespace papilio
