/* -*- mode: c++ -*-
 * Kaleidoscope-Simulator -- A C++ testing API for the Kaleidoscope keyboard 
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

#include "AbsoluteMouseReport.h"

namespace kaleidoscope {
namespace simulator {
   
   AbsoluteMouseReport::AbsoluteMouseReport(const HID_MouseAbsoluteReport_Data_t &report_data)
{
   this->setReportData(report_data);
}

bool AbsoluteMouseReport::operator==(const AbsoluteMouseReport &other) const
{
   return memcmp(&report_data_, &other.report_data_, sizeof(report_data_)) == 0;
}

bool AbsoluteMouseReport::areButtonsPressed(uint8_t button_state) const
{
   return report_data.buttons == button_state;
}

bool AbsoluteMouseReport::isLeftButtonPressed() const
{
   return report_data.buttons & MOUSE_LEFT;
} 

bool AbsoluteMouseReport::isMiddleButtonPressed() const
{
   return report_data.buttons & MOUSE_MIDDLE;
}  

bool AbsoluteMouseReport::isRightButtonPressed() const
{
   return report_data.buttons & MOUSE_RIGHT;
}

uint16_t AbsoluteMouseReport::getXPosition() const
{
   return report_data.xAxis;
}

uint16_t AbsoluteMouseReport::getYPosition() const
{
   return report_data.yAxis;
}

uint16_t AbsoluteMouseReport::getWheelPosition() const
{
   return report_data.wheel;
}

bool AbsoluteMouseReport::isEmpty() const
{
   return (buttons == 0)
       && (xAxis == 0)
       && (yAxis == 0)
       && (wheel == 0);
}

void AbsoluteMouseReport::dump(const Simulator &simulator, const char *add_indent) const
{
  out << add_intent_ << "Absolute mouse report content:";
  out << add_intent_ << "  left button: " << this->isLeftButtonPressed();
  out << add_intent_ << "  middle button: " << this->isMiddleButtonPressed();
  out << add_intent_ << "  right button: " << this->isRightButtonPressed();
  out << add_intent_ << "  x-axis position: " << this->getXPosition();
  out << add_intent_ << "  y-axis position: " << this->getYPosition();
  out << add_intent_ << "  wheel position: " << this->getWheelPosition();
}

void AbsoluteMouseReport::setReportData(const HID_MouseAbsoluteReport_Data_t &report_data)
{
   memcpy(&report_data_, &report_data, sizeof(report_data_));
}

} // namespace simulator
} // namespace kaleidoscope
