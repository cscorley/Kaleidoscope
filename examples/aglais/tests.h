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

#ifdef KALEIDOSCOPE_VIRTUAL_BUILD

#include "Kaleidoscope-Simulator.h"
#include "AglaisInterface.h"

#include <iostream>
#include <sstream>
   
KALEIDOSCOPE_SIMULATOR_INIT

namespace kaleidoscope {
namespace simulator {
   
extern const char aglais_test_recording[];
   
void runSimulator(Simulator &simulator) {
   
   using namespace assertions;
   
   auto test = simulator.newTest("Aglais test");

   processAglaisDocument(aglais_test_recording, simulator);
}

const char aglais_test_recording[] =
"1 1\n"
"firmware_id \"\"\n"
"start_cycle 0 103\n"
"end_cycle 0 5165\n"
"cycles 1 5165 2 1 9 \n"
"start_cycle 3 5175\n"
"action key_pressed 2 14\n"
"reaction hid_report 8 29 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 3 5180\n"
"cycles 4 5180 26 8 1 9 1 2 2 9 2 1 2 2 8 2 2 2 1 9 2 3 2 9 1 2 2 2 9 \n"
"start_cycle 30 5275\n"
"action key_pressed 2 3\n"
"reaction hid_report 8 29 0 128 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 30 5280\n"
"start_cycle 31 5280\n"
"action key_released 2 14\n"
"reaction hid_report 8 29 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 31 5285\n"
"cycles 32 5285 42 9 2 2 8 2 2 2 4 9 2 1 2 10 2 2 1 9 1 2 2 2 2 8 2 3 2 8 2 2 2 1 9 2 2 2 2 9 2 2 1 2 9 \n"
"start_cycle 74 5435\n"
"action key_released 2 3\n"
"reaction hid_report 8 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 74 5440\n"
"cycles 75 5440 5 1 9 2 1 2 \n"
"start_cycle 80 5455\n"
"action key_pressed 1 13\n"
"reaction hid_report 8 29 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 80 5460\n"
"cycles 81 5460 19 3 9 2 9 2 1 2 2 9 2 3 2 9 2 1 2 2 9 2 \n"
"start_cycle 100 5533\n"
"action key_released 1 13\n"
"reaction hid_report 8 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 100 5537\n"
"cycles 101 5537 22 2 10 2 1 2 9 2 1 2 3 9 2 2 2 4 2 2 1 2 2 2 2 \n"
"start_cycle 123 5603\n"
"action key_pressed 1 13\n"
"reaction hid_report 8 29 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 123 5614\n"
"cycles 124 5614 17 2 2 9 2 3 1 9 2 2 2 2 9 2 1 2 2 10 \n"
"start_cycle 141 5676\n"
"action key_released 1 13\n"
"reaction hid_report 8 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 141 5681\n"
"cycles 142 5681 32 2 2 2 1 2 2 2 1 3 2 9 2 2 2 3 2 2 1 2 2 2 1 9 2 1 2 2 10 2 3 2 9 \n"
"start_cycle 174 5772\n"
"action key_pressed 2 13\n"
"reaction hid_report 8 29 0 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 174 5777\n"
"cycles 175 5777 49 2 8 2 2 2 2 9 2 2 1 4 1 2 2 2 2 2 2 9 2 2 2 2 1 3 2 2 2 2 2 1 9 2 2 1 2 2 2 2 2 2 1 3 2 9 2 2 2 2 \n"
"start_cycle 224 5907\n"
"action key_released 2 13\n"
"reaction hid_report 8 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 224 5912\n"
"cycles 225 5912 43 2 1 3 2 1 2 10 1 3 2 2 2 1 3 2 1 2 2 9 2 2 1 2 2 3 2 2 1 2 3 1 2 2 2 2 1 2 2 2 2 1 2 2 \n"
"start_cycle 268 6008\n"
"action key_pressed 1 8\n"
"reaction hid_report 8 29 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 268 6013\n"
"cycles 269 6013 56 3 1 2 9 2 1 2 2 2 3 2 2 2 1 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 2 8 2 2 2 2 2 2 3 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 \n"
"start_cycle 325 6136\n"
"action key_released 1 8\n"
"reaction hid_report 8 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 325 6141\n"
"cycles 326 6141 193 3 2 2 2 3 2 2 2 2 1 2 2 1 2 2 1 2 2 2 2 1 3 1 3 2 2 2 2 3 2 1 2 2 2 2 2 2 1 2 2 2 2 2 1 4 1 2 2 2 2 2 1 9 2 2 1 2 2 2 1 2 2 2 1 3 2 8 3 2 2 2 1 2 2 2 2 1 2 2 9 2 2 2 1 2 3 2 1 2 2 2 2 8 2 2 2 1 2 3 1 2 2 2 1 2 2 9 2 1 2 2 2 1 2 2 2 2 3 1 2 9 2 2 1 2 2 2 1 2 2 2 1 2 2 9 2 2 2 1 2 2 2 2 2 1 2 2 9 2 1 2 2 2 2 2 2 2 1 2 2 2 8 2 2 2 1 3 2 2 2 1 2 3 2 8 2 2 2 2 1 2 2 1 2 2 2 2 2 9 2 2 2 2 \n"
"start_cycle 519 6580\n"
"action key_pressed 3 8\n"
"reaction hid_report 8 29 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 519 6585\n"
"cycles 520 6585 108 1 2 2 2 2 8 2 2 2 2 2 3 2 2 2 2 2 2 8 2 2 2 2 1 2 2 2 2 2 3 1 9 2 2 2 2 2 2 2 2 2 2 1 2 10 1 2 2 2 2 2 1 3 2 1 2 2 9 2 2 2 2 3 1 3 1 2 2 2 2 9 1 2 3 2 2 1 2 2 2 3 2 8 2 2 1 3 3 2 2 2 2 2 1 2 10 2 1 2 2 2 2 2 2 2 2 2 2 \n"
"start_cycle 628 6851\n"
"action key_pressed 2 14\n"
"reaction hid_report 8 29 32 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 628 6863\n"
"cycles 629 6863 91 2 2 1 4 1 2 3 2 3 9 2 2 2 2 2 2 2 1 2 3 2 9 2 1 2 2 2 2 2 2 2 2 2 2 10 2 2 1 2 2 2 2 2 2 2 2 2 8 2 2 2 2 1 3 2 2 2 2 2 2 8 2 2 3 2 1 2 2 2 2 3 2 8 2 2 2 2 2 2 1 2 2 2 2 2 2 9 3 1 3 2 \n"
"start_cycle 720 7093\n"
"action key_released 2 14\n"
"reaction hid_report 8 29 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 720 7098\n"
"cycles 721 7098 19 2 1 2 2 2 9 2 2 2 2 3 2 2 1 2 2 2 8 2 \n"
"start_cycle 740 7148\n"
"action key_pressed 2 3\n"
"reaction hid_report 8 29 32 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 740 7154\n"
"cycles 741 7154 41 2 1 2 2 2 2 3 2 8 3 2 2 1 2 2 2 2 2 2 2 2 9 3 2 2 2 2 2 2 2 2 2 2 8 2 2 2 2 1 3 2 \n"
"start_cycle 782 7256\n"
"action key_released 2 3\n"
"reaction hid_report 8 29 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 782 7261\n"
"cycles 783 7261 51 2 2 2 9 2 1 2 2 3 2 2 2 2 3 2 8 2 2 2 2 2 2 2 2 2 2 2 2 10 1 2 2 2 2 2 2 2 2 2 2 8 2 2 1 2 2 3 2 2 2 1 \n"
"start_cycle 834 7389\n"
"action key_pressed 1 13\n"
"reaction hid_report 8 29 32 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 834 7395\n"
"cycles 835 7395 18 9 2 2 2 3 2 2 2 2 3 2 9 1 2 2 2 2 2 \n"
"start_cycle 853 7446\n"
"action key_released 1 13\n"
"reaction hid_report 8 29 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 853 7451\n"
"cycles 854 7451 24 2 2 2 2 9 2 2 4 1 2 2 2 2 1 2 2 9 2 1 2 2 2 3 1 \n"
"start_cycle 878 7512\n"
"action key_pressed 1 13\n"
"reaction hid_report 8 29 32 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 878 7518\n"
"cycles 879 7518 27 2 2 9 2 2 2 3 2 1 2 2 2 3 2 8 2 2 2 2 2 2 2 2 2 2 2 2 \n"
"start_cycle 906 7586\n"
"action key_released 1 13\n"
"reaction hid_report 8 29 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 906 7599\n"
"cycles 907 7599 34 2 2 2 2 1 3 2 2 2 2 9 2 2 2 2 2 2 2 2 2 2 2 9 2 1 2 2 2 2 2 1 2 2 3 \n"
"start_cycle 941 7680\n"
"action key_pressed 2 13\n"
"reaction hid_report 8 29 32 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 941 7685\n"
"cycles 942 7685 40 9 2 1 2 2 2 2 2 2 2 2 2 10 2 2 2 2 2 2 2 2 2 2 1 9 2 2 2 1 2 3 2 2 2 2 2 2 9 1 2 \n"
"start_cycle 982 7791\n"
"action key_released 2 13\n"
"reaction hid_report 8 29 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 982 7796\n"
"cycles 983 7796 21 2 2 2 2 1 3 2 9 2 2 2 2 2 2 2 2 1 2 2 2 10 \n"
"start_cycle 1004 7852\n"
"action key_released 3 8\n"
"reaction hid_report 8 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \n"
"end_cycle 1004 7857\n"
"cycles 1005 7857 537 2 2 1 2 2 3 2 2 2 9 2 2 2 2 3 2 2 2 2 2 2 9 2 2 2 2 2 2 2 1 2 3 2 9 1 2 2 2 2 2 2 2 2 2 2 2 10 2 2 2 2 1 2 2 2 2 2 2 2 8 2 2 2 2 3 2 2 2 2 2 2 2 2 2 2 1 2 2 2 1 2 2 2 2 2 2 3 2 9 2 2 2 2 1 2 2 2 2 2 2 2 1 2 3 3 1 2 3 2 1 2 2 2 2 1 2 2 2 2 2 3 2 1 2 2 2 3 2 2 2 1 2 2 2 2 2 1 3 2 2 1 2 2 2 2 2 2 1 3 2 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 1 2 2 2 2 3 2 3 2 2 2 2 2 2 1 3 2 1 2 2 2 2 2 2 2 1 4 1 2 2 2 2 2 2 2 2 2 3 2 2 1 2 2 2 1 2 2 3 2 9 1 2 2 3 2 2 1 3 1 3 2 2 1 2 3 3 2 1 2 2 3 1 2 2 2 2 2 2 8 2 2 2 3 3 1 2 2 2 2 2 8 2 2 2 2 2 2 2 3 2 3 1 2 9 2 2 2 1 2 2 2 2 2 2 2 2 9 2 2 2 1 2 2 2 2 2 2 2 2 9 2 2 2 2 3 1 3 2 2 1 2 2 2 3 2 2 2 1 2 2 2 2 2 2 2 2 3 8 2 2 2 2 2 2 2 2 2 2 2 2 9 2 2 2 2 1 3 1 2 2 3 2 8 3 2 2 2 1 3 2 2 2 2 2 2 8 3 1 2 2 2 2 2 2 1 2 3 3 8 3 1 2 2 2 2 2 2 2 2 1 2 10 2 2 1 2 3 1 2 2 2 2 2 8 2 2 2 2 2 3 1 2 2 2 2 2 9 1 2 2 2 2 2 2 2 2 2 2 2 9 2 2 2 2 2 2 1 2 2 2 2 2 9 2 2 2 2 2 2 2 2 2 2 1 2 9 1 3 2 1 2 3 2 2 1 2 3 2 8 2 2 2 2 1 2 3 1 2 2 3 2 9 2 2 1 2 2 2 2 2 1 2 2 2 10 1 2 2 2 3 1 2 2 2 2 2 2 9 2 1 3 2 3 1 2 2 2 2 2 9 2 2 1 2 2 2 2 2 2 2 2 2 9 2 2 2 2 2 2 1 2 3 \n"

;

} // namespace simulator
} // namespace kaleidoscope

#endif
