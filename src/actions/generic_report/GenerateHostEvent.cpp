/* -*- mode: c++ -*-
 * Kaleidoscope-Simulator -- A C++ testing API for the Kaleidoscope absolute mouse 
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

#include "GenerateHostEvent.h"

#ifdef __unix__ /* __unix__ is usually defined by compilers targeting Unix systems */

#include <X11/extensions/XTest.h>
#include <unistd.h>

namespace kaleidoscope {
namespace simulator {
   
template<>
bool GenerateHostEvent<KeyboardReport>::Action::evalInternal()
{
   
   
   const auto &report = this->getReport();
   
   Display *display = NULL;
   XEvent event;
   display = XOpenDisplay (NULL);
   
   XTestFakeKeyEvent(display, keycode, is_press, delay); 
   return true;
}

template<>
bool GenerateHostEvent<MouseReport>::Action::evalInternal()
{
   const auto &report = this->getReport();
   
   Display *display = NULL;
   XEvent event;
   display = XOpenDisplay (NULL);
   
   /* Get the current pointer position */
   XQueryPointer (display, RootWindow (display, 0), 
                  &event.xbutton.root,
                  &event.xbutton.window, 
                  &event.xbutton.x_root,
                  &event.xbutton.y_root, 
                  &event.xbutton.x, 
                  &event.xbutton.y,
                  &event.xbutton.state);
   
   XTestFakeRelativeMotionEvent (display, 0, 
                  event.xbutton.x + report.getXMovement(),
                  event.xbutton.y + report.getYMovement(),
                  CurrentTime);
   
   XTestFakeButtonEvent (display, 1, report.isLeftButtonPressed(),  CurrentTime);
   XTestFakeButtonEvent (display, 2, report.isMiddleButtonPressed(),  CurrentTime);
   XTestFakeButtonEvent (display, 3, report.isRightButtonPressed(),  CurrentTime);
   
   auto v_wheel = report.getVerticalWheel();
   auto h_wheel = report.getHorizontalWheel();
   
   // X11 defines mouse button 4 as vertical scroll wheel up action and mouse
   // button 5 as vertical scroll wheel down action.
   //
   if(v_wheel > 0) {
      for(int i = 0; i < v_wheel; ++i) {
         XTestFakeButtonEvent (display, 4, True,  CurrentTime);
         // Release events can be ignored
      }
   }
   else if(v_wheel < 0) {
      for(int i = 0; i > v_wheel; --i) {
         XTestFakeButtonEvent (display, 5, True,  CurrentTime);
      }
   }
   
   // X11 defines mouse button 6 as horizontal scroll wheel left action and mouse
   // button 7 as horizontal scroll wheel down action.
   //
   if(h_wheel > 0) {
      for(int i = 0; i < h_wheel; ++i) {
         XTestFakeButtonEvent (display, 6, True,  CurrentTime);
      }
   }
   else if(h_wheel < 0) {
      for(int i = 0; i > h_wheel; --i) {
         XTestFakeButtonEvent (display, 7, True,  CurrentTime);
      }
   }
         
   XSync(display, 0);
   
   return true;
}

template<>
bool GenerateHostEvent<AbsoluteMouseReport>::Action::evalInternal()
{
   const auto &report = this->getReport();
   
   Display *display = NULL;
   XEvent event;
   display = XOpenDisplay (NULL);
   
   /* Get the current pointer position */
   XQueryPointer (display, RootWindow (display, 0), 
                  &event.xbutton.root,
                  &event.xbutton.window, 
                  &event.xbutton.x_root,
                  &event.xbutton.y_root, 
                  &event.xbutton.x, 
                  &event.xbutton.y,
                  &event.xbutton.state);
   
   XTestFakeMotionEvent (display, 0, 
                  event.xbutton.x + report.getXPosition(),
                  event.xbutton.y + report.getYMovement(),
                  CurrentTime);
   
   XTestFakeButtonEvent (display, 1, report.isLeftButtonPressed(),  CurrentTime);
   XTestFakeButtonEvent (display, 2, report.isMiddleButtonPressed(),  CurrentTime);
   XTestFakeButtonEvent (display, 3, report.isRightButtonPressed(),  CurrentTime);
   
   auto v_wheel = report.getVerticalWheel();
   auto h_wheel = report.getHorizontalWheel();
   
   // X11 defines mouse button 4 as vertical scroll wheel up action and mouse
   // button 5 as vertical scroll wheel down action.
   //
   if(v_wheel > 0) {
      for(int i = 0; i < v_wheel; ++i) {
         XTestFakeButtonEvent (display, 4, True,  CurrentTime);
         // Release events can be ignored
      }
   }
   else if(v_wheel < 0) {
      for(int i = 0; i > v_wheel; --i) {
         XTestFakeButtonEvent (display, 5, True,  CurrentTime);
      }
   }
   
   // X11 defines mouse button 6 as horizontal scroll wheel left action and mouse
   // button 7 as horizontal scroll wheel down action.
   //
//    if(h_wheel > 0) {
//       for(int i = 0; i < h_wheel; ++i) {
//          XTestFakeButtonEvent (display, 6, True,  CurrentTime);
//       }
//    }
//    else if(h_wheel < 0) {
//       for(int i = 0; i > h_wheel; --i) {
//          XTestFakeButtonEvent (display, 7, True,  CurrentTime);
//       }
//    }
         
   XSync(display, 0);
   
   return true;
}
   
} // namespace simulator
} // namespace kaleidoscope

#else
#error __CLANG_ATOMIC_LLONG_LOCK_FREE
#endif
