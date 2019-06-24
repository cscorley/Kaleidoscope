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

#include "papilio/src/Simulator.h"
#include "papilio/src/Visualization.h"
#include "papilio/src/aux/keycodes.h"
#include "papilio/src/reports/KeyboardReport.h"
#include "papilio/src/LED_Checks.h"

#include "papilio/src/actions/Grouped.h"
#include "papilio/src/actions/AssertLayerIsActive.h"
#include "papilio/src/actions/AssertTopActiveLayerIs.h"
#include "papilio/src/actions/CustomAction.h"
#include "papilio/src/actions/AssertNumOverallReportsEquals.h"
#include "papilio/src/actions/Action_.h"
#include "papilio/src/actions/AssertCycleIsNth.h"
#include "papilio/src/actions/AssertElapsedTimeGreater.h"

#include "papilio/src/actions/generic_report/AssertReportEmpty.h"
#include "papilio/src/actions/generic_report/AssertReportEquals.h"
#include "papilio/src/actions/generic_report/DumpReport.h"
#include "papilio/src/actions/generic_report/AssertReportIsNthInCycle.h"
#include "papilio/src/actions/generic_report/CustomReportAction.h"
#include "papilio/src/actions/generic_report/AssertCycleGeneratesNReports.h"
#include "papilio/src/actions/generic_report/GenerateHostEvent.h"

#include "papilio/src/actions/keyboard_report/AssertModifiersActive.h"
#include "papilio/src/actions/keyboard_report/AssertAnyKeycodeActive.h"
#include "papilio/src/actions/keyboard_report/AssertKeycodesActive.h"
#include "papilio/src/actions/keyboard_report/AssertAnyModifierActive.h"

#include <iostream>

extern void executeTestFunction();

/// @brief Initializes testing.
/// @details VERY IMPORTANT: Make sure to invoke this macro in your sketch
///        to enable testing.
///
#define KALEIDOSCOPE_SIMULATOR_INIT                                            \
                                                                               \
   namespace kaleidoscope {                                                    \
   namespace papilio {                                                       \
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
      using namespace kaleidoscope::simulator;                                 \
      runSimulator(Simulator::getInstance());                                  \
   }
