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

#include "papilio/aux/WallTimer.h"

namespace papilio {

void WallTimer::start() {
  start_time_ = std::chrono::high_resolution_clock::now();
}

double WallTimer::elapsed() {
  static constexpr double inv_clocks_per_sec = 1.0 / CLOCKS_PER_SEC;
  auto cur_time = std::chrono::high_resolution_clock::now();
  return std::chrono::duration<double, std::milli>(cur_time - start_time_).count();
}

} // namespace papilio
