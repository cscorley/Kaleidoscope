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

#pragma once

#include "Simulator.h"
#include "Visualization.h"
#include "aux/keycodes.h"
#include "reports/KeyboardReport.h"
#include "LED_Checks.h"

#include "assertions/Grouped.h"
#include "assertions/LayerIsActive.h"
#include "assertions/TopActiveLayerIs.h"
#include "assertions/CustomAssertion.h"
#include "assertions/NumOverallReportsGenerated.h"
#include "assertions/Assertion_.h"
#include "assertions/CycleIsNth.h"
#include "assertions/ElapsedTimeGreater.h"

#include "assertions/generic_report/ReportEmpty.h"
#include "assertions/generic_report/ReportEquals.h"
#include "assertions/generic_report/DumpReport.h"
#include "assertions/generic_report/ReportNthInCycle.h"
#include "assertions/generic_report/CustomReportAssertion.h"
#include "assertions/generic_report/CycleGeneratesNReports.h"

#include "assertions/keyboard_report/ModifiersActive.h"
#include "assertions/keyboard_report/AnyKeycodeActive.h"
#include "assertions/keyboard_report/KeycodesActive.h"
#include "assertions/keyboard_report/AnyModifierActive.h"

#include <iostream>

extern void executeTestFunction();

/// @brief Initializes testing.
/// @details VERY IMPORTANT: Make sure to invoke this macro in your sketch
///        to enable testing.
///
#define KALEIDOSCOPE_SIMULATOR_INIT                                            \
                                                                               \
   namespace kaleidoscope {                                                    \
   namespace simulator {                                                       \
   /* Forward declare the actual test function */                              \
   void runSimulator(Simulator &simulator);                                    \
   } /* namespace simulator */                                                 \
   } /* namespace kaleidoscope */                                              \
                                                                               \
   /* This is an override of the weak function defined in main.cpp             \
    * of the virtual core.                                                     \
    */                                                                         \
   void executeTestFunction() {                                                \
      setup(); /* setup Kaleidoscope */                                        \
      kaleidoscope::simulator::Simulator simulator(std::cout, false);          \
      kaleidoscope::simulator::runSimulator(simulator);                        \
   }
