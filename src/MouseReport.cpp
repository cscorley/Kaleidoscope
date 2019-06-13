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

#include "MouseReport.h"
 
namespace kaleidoscope {
namespace simulator {
   
   MouseReport::MouseReport(const HID_MouseReport_Data_t &report_data)
{
   this->setReportData(report_data);
}

bool operator==(const MouseReport &other) const
{
   return memcmp(&report_data_, &other.report_data_, sizeof(report_data_)) == 0;
}
      
bool MouseReport::areButtonsPressed(uint8_t button_state) const
{
   return report_data.buttons == button_state;
}

bool MouseReport::isLeftButtonPressed() const
{
   return report_data.buttons & MOUSE_LEFT;
} 

bool MouseReport::isMiddleButtonPressed() const
{
   return report_data.buttons & MOUSE_MIDDLE;
}  

bool MouseReport::isRightButtonPressed() const
{
   return report_data.buttons & MOUSE_RIGHT;
}

signed char MouseReport::getMovementX() const
{
   return report_data.xAxis;
}

signed char MouseReport::getMovementY() const
{
   return report_data.yAxis;
}

signed char MouseReport::getVerticalWheel() const
{
   return report_data.vWheel;
}  

signed char MouseReport::getHorizontalWheel() const
{
   return report_data.hWheel;
}

bool isEmpty() const
{
   return (buttons == 0)
       && (xAxis == 0)
       && (yAxis == 0)
       && (vWheel == 0)
       && (hWheel == 0);
}

void MouseReport::dump(const Simulator &simulator, const char *add_indent) const
{
  out << add_intent_ << "Mouse report content:";
  out << add_intent_ << "  left button: " << this->isLeftButtonPressed();
  out << add_intent_ << "  middle button: " << this->isMiddleButtonPressed();
  out << add_intent_ << "  right button: " << this->isRightButtonPressed();
  out << add_intent_ << "  x-axis motion: " << this->getMovementX();
  out << add_intent_ << "  y-axis motion: " << this->getMovementY();
  out << add_intent_ << "  horizontal wheel motion: " << this->getHorizontalWheel();
  out << add_intent_ << "  vertical wheel motion: " << this->getVerticalWheel();
}

void MouseReport::setReportData(const HID_MouseReport_Data_t &report_data)
{
   memcpy(&report_data_, &report_data, sizeof(report_data_));
}
