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
#include "Simulator.h"
 
namespace kaleidoscope {
namespace simulator {
   
   MouseReport::MouseReport(const HID_MouseReport_Data_t &report_data)
{
   this->setReportData(report_data);
}

   MouseReport::MouseReport(const void *data)
{
   const ReportDataType &report_data 
            = *static_cast<const ReportDataType *>(data);
   
   this->setReportData(report_data);
}

bool MouseReport::operator==(const MouseReport &other) const
{
   return memcmp(&report_data_, &other.report_data_, sizeof(report_data_)) == 0;
}
      
bool MouseReport::areButtonsPressed(uint8_t button_state) const
{
   return report_data_.buttons == button_state;
}

bool MouseReport::isLeftButtonPressed() const
{
   return report_data_.buttons & MOUSE_LEFT;
} 

bool MouseReport::isMiddleButtonPressed() const
{
   return report_data_.buttons & MOUSE_MIDDLE;
}  

bool MouseReport::isRightButtonPressed() const
{
   return report_data_.buttons & MOUSE_RIGHT;
}

signed char MouseReport::getMovementX() const
{
   return report_data_.xAxis;
}

signed char MouseReport::getMovementY() const
{
   return report_data_.yAxis;
}

signed char MouseReport::getVerticalWheel() const
{
   return report_data_.vWheel;
}  

signed char MouseReport::getHorizontalWheel() const
{
   return report_data_.hWheel;
}

bool MouseReport::isEmpty() const
{
   return (report_data_.buttons == 0)
       && (report_data_.xAxis == 0)
       && (report_data_.yAxis == 0)
       && (report_data_.vWheel == 0)
       && (report_data_.hWheel == 0);
}

void MouseReport::dump(const Simulator &simulator, const char *add_indent) const
{
  simulator.log() << add_indent << "Mouse report content:";
  simulator.log() << add_indent << "  left button: " << this->isLeftButtonPressed();
  simulator.log() << add_indent << "  middle button: " << this->isMiddleButtonPressed();
  simulator.log() << add_indent << "  right button: " << this->isRightButtonPressed();
  simulator.log() << add_indent << "  x-axis motion: " << this->getMovementX();
  simulator.log() << add_indent << "  y-axis motion: " << this->getMovementY();
  simulator.log() << add_indent << "  horizontal wheel motion: " << this->getHorizontalWheel();
  simulator.log() << add_indent << "  vertical wheel motion: " << this->getVerticalWheel();
}

void MouseReport::setReportData(const HID_MouseReport_Data_t &report_data)
{
   memcpy(&report_data_, &report_data, sizeof(report_data_));
}

} // namespace simulator
} // namespace kaleidoscope
