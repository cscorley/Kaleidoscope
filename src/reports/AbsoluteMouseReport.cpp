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

#include "reports/AbsoluteMouseReport.h"
#include "Simulator.h"

namespace kaleidoscope {
namespace simulator {
   
   AbsoluteMouseReport::AbsoluteMouseReport()
   :  report_data_{}
{
}

   AbsoluteMouseReport::AbsoluteMouseReport(const HID_MouseAbsoluteReport_Data_t &report_data)
{
   this->setReportData(report_data);
}

   AbsoluteMouseReport::AbsoluteMouseReport(const void *data)
{
   const ReportDataType &report_data
            = *static_cast<const ReportDataType *>(data);
   
   this->setReportData(report_data);
}

bool AbsoluteMouseReport::operator==(const AbsoluteMouseReport &other) const
{
   return memcmp(&report_data_, &other.report_data_, sizeof(report_data_)) == 0;
}

bool AbsoluteMouseReport::areButtonsPressed(uint8_t button_state) const
{
   return report_data_.buttons == button_state;
}

bool AbsoluteMouseReport::isLeftButtonPressed() const
{
   return report_data_.buttons & MOUSE_LEFT;
} 

bool AbsoluteMouseReport::isMiddleButtonPressed() const
{
   return report_data_.buttons & MOUSE_MIDDLE;
}  

bool AbsoluteMouseReport::isRightButtonPressed() const
{
   return report_data_.buttons & MOUSE_RIGHT;
}

uint16_t AbsoluteMouseReport::getXPosition() const
{
   return report_data_.xAxis;
}

uint16_t AbsoluteMouseReport::getYPosition() const
{
   return report_data_.yAxis;
}

uint16_t AbsoluteMouseReport::getWheelPosition() const
{
   return report_data_.wheel;
}

bool AbsoluteMouseReport::isEmpty() const
{
   return (report_data_.buttons == 0)
       && (report_data_.xAxis == 0)
       && (report_data_.yAxis == 0)
       && (report_data_.wheel == 0);
}

void AbsoluteMouseReport::dump(const Simulator &simulator, const char *add_indent) const
{
  simulator.log() << add_indent << "Absolute mouse report content:";
  simulator.log() << add_indent << "  left button: " << this->isLeftButtonPressed();
  simulator.log() << add_indent << "  middle button: " << this->isMiddleButtonPressed();
  simulator.log() << add_indent << "  right button: " << this->isRightButtonPressed();
  simulator.log() << add_indent << "  x-axis position: " << this->getXPosition();
  simulator.log() << add_indent << "  y-axis position: " << this->getYPosition();
  simulator.log() << add_indent << "  wheel position: " << this->getWheelPosition();
}

void AbsoluteMouseReport::setReportData(const HID_MouseAbsoluteReport_Data_t &report_data)
{
   memcpy(&report_data_, &report_data_, sizeof(report_data_));
}

} // namespace simulator
} // namespace kaleidoscope
