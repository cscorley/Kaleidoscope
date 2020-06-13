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

#ifdef KALEIDOSCOPE_VIRTUAL_BUILD

#include "papilio/Papilio_Simulator.h"
#include "papilio/Visualization.h"
#include "papilio/LED_Checks.h"

#include "papilio/reports/BootKeyboardReport_.h"
#include "papilio/reports/KeyboardReport_.h"
#include "papilio/reports/MouseReport_.h"
#include "papilio/reports/AbsoluteMouseReport_.h"

#include "papilio/actions/Grouped.h"
#include "papilio/actions/CustomAction.h"
#include "papilio/actions/AssertNumOverallReportsEquals.h"
#include "papilio/actions/Action_.h"
#include "papilio/actions/AssertCycleIsNth.h"
#include "papilio/actions/AssertElapsedTimeGreater.h"

#include "papilio/actions/generic_report/AssertReportEmpty.h"
#include "papilio/actions/generic_report/AssertReportEquals.h"
#include "papilio/actions/generic_report/DumpReport.h"
#include "papilio/actions/generic_report/AssertReportIsNthInCycle.h"
#include "papilio/actions/generic_report/CustomReportAction.h"
#include "papilio/actions/generic_report/AssertCycleGeneratesNReports.h"

#include "papilio/actions/keyboard_report/AssertModifiersActive.h"
#include "papilio/actions/keyboard_report/AssertAnyKeycodeActive.h"
#include "papilio/actions/keyboard_report/AssertKeycodesActive.h"
#include "papilio/actions/keyboard_report/AssertAnyModifierActive.h"

#endif
