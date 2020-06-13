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

#include "papilio/actions/generic_report/ReportAction.h"

namespace papilio {
namespace actions {

/// @brief Asserts that any keycodes are active in the current report.
///
class AssertAnyKeycodeActive {

 public:

  PAPILIO_ACTION_STD_CONSTRUCTOR(AssertAnyKeycodeActive)

 private:

  class Action : public ReportAction<KeyboardReport_> {

   public:

    virtual void describe(const char *add_indent = "") const override {
      this->getSimulator()->log() << add_indent << "Any keycodes active";
    }

    virtual void describeState(const char *add_indent = "") const {
      this->getSimulator()->log() << add_indent << "Any keycodes active: ";
      this->getSimulator()->log() << this->getReport().isAnyKeyActive();
    }

    virtual bool evalInternal() override {
      return this->getReport().isAnyKeyActive();
    }
  };

  PAPILIO_AUTO_DEFINE_ACTION_INVENTORY(AssertAnyKeycodeActive)
};

} // namespace actions
} // namespace papilio

#endif // KALEIDOSCOPE_VIRTUAL_BUILD
