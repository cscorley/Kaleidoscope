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

#include "papilio/src/Visualization.h"
#include "papilio/src/Simulator.h"
#include "papilio/src/aux/terminal_escape_sequences.h"

// Undef those stupid Arduino-macros conflicting with stl stuff
//
#undef min
#undef max

#include <map>
#include <sstream>
#include <regex>
#include <iostream>

namespace papilio {
   
std::map<uint8_t, const char*> hid_code_to_string = {
   { 0x04 , "A   " }, // HID_KEYBOARD_A_AND_A
   { 0x05 , "B   " }, // HID_KEYBOARD_B_AND_B
   { 0x06 , "C   " }, // HID_KEYBOARD_C_AND_C
   { 0x07 , "D   " }, // HID_KEYBOARD_D_AND_D
   { 0x08 , "E   " }, // HID_KEYBOARD_E_AND_E
   { 0x09 , "F   " }, // HID_KEYBOARD_F_AND_F
   { 0x0A , "G   " }, // HID_KEYBOARD_G_AND_G
   { 0x0B , "H   " }, // HID_KEYBOARD_H_AND_H
   { 0x0C , "I   " }, // HID_KEYBOARD_I_AND_I
   { 0x0D , "J   " }, // HID_KEYBOARD_J_AND_J
   { 0x0E , "K   " }, // HID_KEYBOARD_K_AND_K
   { 0x0F , "L   " }, // HID_KEYBOARD_L_AND_L
   { 0x10 , "M   " }, // HID_KEYBOARD_M_AND_M
   { 0x11 , "N   " }, // HID_KEYBOARD_N_AND_N
   { 0x12 , "O   " }, // HID_KEYBOARD_O_AND_O
   { 0x13 , "P   " }, // HID_KEYBOARD_P_AND_P
   { 0x14 , "Q   " }, // HID_KEYBOARD_Q_AND_Q
   { 0x15 , "R   " }, // HID_KEYBOARD_R_AND_R
   { 0x16 , "S   " }, // HID_KEYBOARD_S_AND_S
   { 0x17 , "T   " }, // HID_KEYBOARD_T_AND_T
   { 0x18 , "U   " }, // HID_KEYBOARD_U_AND_U
   { 0x19 , "V   " }, // HID_KEYBOARD_V_AND_V
   { 0x1A , "W   " }, // HID_KEYBOARD_W_AND_W
   { 0x1B , "X   " }, // HID_KEYBOARD_X_AND_X
   { 0x1C , "Y   " }, // HID_KEYBOARD_Y_AND_Y
   { 0x1D , "Z   " }, // HID_KEYBOARD_Z_AND_Z
   { 0x1E , "1 ! " }, // HID_KEYBOARD_1_AND_EXCLAMATION_POINT
   { 0x1F , "2 @ " }, // HID_KEYBOARD_2_AND_AT
   { 0x20 , "3 # " }, // HID_KEYBOARD_3_AND_POUND
   { 0x21 , "4 $ " }, // HID_KEYBOARD_4_AND_DOLLAR
   { 0x22 , "5 % " }, // HID_KEYBOARD_5_AND_PERCENT
   { 0x23 , "6 ^ " }, // HID_KEYBOARD_6_AND_CARAT
   { 0x24 , "7 & " }, // HID_KEYBOARD_7_AND_AMPERSAND
   { 0x25 , "8 * " }, // HID_KEYBOARD_8_AND_ASTERISK
   { 0x26 , "9 ( " }, // HID_KEYBOARD_9_AND_LEFT_PAREN
   { 0x27 , "0 ) " }, // HID_KEYBOARD_0_AND_RIGHT_PAREN
   { 0x28 , "Entr" }, // HID_KEYBOARD_ENTER	{ 0x28	 // (MARKED AS ENTER_SLASH_RETURN)
   { 0x29 , "Esc " }, // HID_KEYBOARD_ESCAPE
   { 0x2A , "Del " }, // HID_KEYBOARD_DELETE	{ 0x2A	// (BACKSPACE)
   { 0x2B , "Tab " }, // HID_KEYBOARD_TAB
   { 0x2C , "Spce" }, // HID_KEYBOARD_SPACEBAR
   { 0x2D , "- _ " }, // HID_KEYBOARD_MINUS_AND_UNDERSCORE	{ 0x2D	 // (UNDERSCORE)
   { 0x2E , "= + " }, // HID_KEYBOARD_EQUALS_AND_PLUS
   { 0x2F , "[ { " }, // HID_KEYBOARD_LEFT_BRACKET_AND_LEFT_CURLY_BRACE
   { 0x30 , "] } " }, // HID_KEYBOARD_RIGHT_BRACKET_AND_RIGHT_CURLY_BRACE
   { 0x31 , "\\ | " }, // HID_KEYBOARD_BACKSLASH_AND_PIPE
   { 0x32 , "   ~ " }, // HID_KEYBOARD_NON_US_POUND_AND_TILDE
   { 0x33 , "; , " }, // HID_KEYBOARD_SEMICOLON_AND_COLON
   { 0x34 , "\' \" " }, // HID_KEYBOARD_QUOTE_AND_DOUBLEQUOTE
   { 0x35 , "` ~ " }, // HID_KEYBOARD_GRAVE_ACCENT_AND_TILDE
   { 0x36 , ", < " }, // HID_KEYBOARD_COMMA_AND_LESS_THAN
   { 0x37 , ". > " }, // HID_KEYBOARD_PERIOD_AND_GREATER_THAN
   { 0x38 , "/ ? " }, // HID_KEYBOARD_SLASH_AND_QUESTION_MARK
   { 0x39 , "C.L." }, // HID_KEYBOARD_CAPS_LOCK
   { 0x3A , "F1  " }, // HID_KEYBOARD_F1
   { 0x3B , "F2  " }, // HID_KEYBOARD_F2
   { 0x3C , "F3  " }, // HID_KEYBOARD_F3
   { 0x3D , "F4  " }, // HID_KEYBOARD_F4
   { 0x3E , "F5  " }, // HID_KEYBOARD_F5
   { 0x3F , "F6  " }, // HID_KEYBOARD_F6
   { 0x40 , "F7  " }, // HID_KEYBOARD_F7
   { 0x41 , "F8  " }, // HID_KEYBOARD_F8
   { 0x42 , "F9  " }, // HID_KEYBOARD_F9
   { 0x43 , "F10 " }, // HID_KEYBOARD_F10
   { 0x44 , "F11 " }, // HID_KEYBOARD_F11
   { 0x45 , "F12 " }, // HID_KEYBOARD_F12
   { 0x46 , "PRTS" }, // HID_KEYBOARD_PRINTSCREEN
   { 0x47 , "ScLk" }, // HID_KEYBOARD_SCROLL_LOCK
   { 0x48 , "Pse " }, // HID_KEYBOARD_PAUSE
   { 0x49 , "Isrt" }, // HID_KEYBOARD_INSERT
   { 0x4A , "Home" }, // HID_KEYBOARD_HOME
   { 0x4B , "PgUp" }, // HID_KEYBOARD_PAGE_UP
   { 0x4C , "Del " }, // HID_KEYBOARD_DELETE_FORWARD
   { 0x4D , "End " }, // HID_KEYBOARD_END
   { 0x4E , "PgDn" }, // HID_KEYBOARD_PAGE_DOWN
   { 0x4F , "→   " }, // HID_KEYBOARD_RIGHT_ARROW
   { 0x50 , "←   " }, // HID_KEYBOARD_LEFT_ARROW
   { 0x51 , "↓   " }, // HID_KEYBOARD_DOWN_ARROW
   { 0x52 , "↑   " }, // HID_KEYBOARD_UP_ARROW
   { 0x53 , "NlCl" }, // HID_KEYPAD_NUM_LOCK_AND_CLEAR
   { 0x54 , "/   " }, // HID_KEYPAD_DIVIDE
   { 0x55 , "*   " }, // HID_KEYPAD_MULTIPLY
   { 0x56 , "-   " }, // HID_KEYPAD_SUBTRACT
   { 0x57 , "+   " }, // HID_KEYPAD_ADD
   { 0x58 , "Entr" }, // HID_KEYPAD_ENTER
   { 0x59 , "1 Ed" }, // HID_KEYPAD_1_AND_END
   { 0x5A , "2 ↓ " }, // HID_KEYPAD_2_AND_DOWN_ARROW
   { 0x5B , "3 PD" }, // HID_KEYPAD_3_AND_PAGE_DOWN
   { 0x5C , "4 ← " }, // HID_KEYPAD_4_AND_LEFT_ARROW
   { 0x5D , "5   " }, // HID_KEYPAD_5
   { 0x5E , "6 → " }, // HID_KEYPAD_6_AND_RIGHT_ARROW
   { 0x5F , "7 Hm" }, // HID_KEYPAD_7_AND_HOME
   { 0x60 , "8 ↑ " }, // HID_KEYPAD_8_AND_UP_ARROW
   { 0x61 , "9 PU" }, // HID_KEYPAD_9_AND_PAGE_UP
   { 0x62 , "0 IN" }, // HID_KEYPAD_0_AND_INSERT
   { 0x63 , ". DL" }, // HID_KEYPAD_PERIOD_AND_DELETE
   { 0x64 , "\\ | " }, // HID_KEYBOARD_NON_US_BACKSLASH_AND_PIPE
   //{ 0x65 }, // HID_KEYBOARD_APPLICATION
   //{ 0x66 }, // HID_KEYBOARD_POWER
   { 0x67 , "=   " }, // HID_KEYPAD_EQUALS
   { 0x68 , "F13 " }, // HID_KEYBOARD_F13
   { 0x69 , "F14 " }, // HID_KEYBOARD_F14
   { 0x6A , "F15 " }, // HID_KEYBOARD_F15
   { 0x6B , "F16 " }, // HID_KEYBOARD_F16
   { 0x6C , "F17 " }, // HID_KEYBOARD_F17
   { 0x6D , "F18 " }, // HID_KEYBOARD_F18
   { 0x6E , "F19 " }, // HID_KEYBOARD_F19
   { 0x6F , "F20 " }, // HID_KEYBOARD_F20
   { 0x70 , "F21 " }, // HID_KEYBOARD_F21
   { 0x71 , "F22 " }, // HID_KEYBOARD_F22
   { 0x72 , "F23 " }, // HID_KEYBOARD_F23
   { 0x73 , "F24 " }, // HID_KEYBOARD_F24
   //{ 0x74 ,  }, // HID_KEYBOARD_EXECUTE
   //{ 0x75 ,  }, // HID_KEYBOARD_HELP
   //{ 0x76 ,  }, // HID_KEYBOARD_MENU
   //{ 0x77 ,  }, // HID_KEYBOARD_SELECT
   //{ 0x78 ,  }, // HID_KEYBOARD_STOP
   //{ 0x79 ,  }, // HID_KEYBOARD_AGAIN
   //{ 0x7A ,  }, // HID_KEYBOARD_UNDO
   //{ 0x7B ,  }, // HID_KEYBOARD_CUT
   //{ 0x7C ,  }, // HID_KEYBOARD_COPY
   //{ 0x7D ,  }, // HID_KEYBOARD_PASTE
   //{ 0x7E ,  }, // HID_KEYBOARD_FIND
   //{ 0x7F ,  }, // HID_KEYBOARD_MUTE
   //{ 0x80 ,  }, // HID_KEYBOARD_VOLUME_UP
   //{ 0x81 ,  }, // HID_KEYBOARD_VOLUME_DOWN
   //{ 0x82 ,  }, // HID_KEYBOARD_LOCKING_CAPS_LOCK
   //{ 0x83 ,  }, // HID_KEYBOARD_LOCKING_NUM_LOCK
   //{ 0x84 ,  }, // HID_KEYBOARD_LOCKING_SCROLL_LOCK
   { 0x85 , ",   " }, // HID_KEYPAD_COMMA
   { 0x86 , "=   " } // HID_KEYPAD_EQUAL_SIGN
};
   
typedef std::map<uint8_t, std::string> KeyAddrToKeyString;

class KeyboardRenderer
{
   public:
      
      KeyboardRenderer(const SimulatorCore_ &simulator_core)
         :  simulator_core_(simulator_core)
      {}

      std::string generateColorEscSeq(uint8_t row, uint8_t col) {
         
         using namespace terminal_escape_sequences;
         
         uint8_t red = 0, green = 0,  = 0;
            
         simulator_core_.getCurrentKeyLEDColor(row, col, red, green, );
         
         int col_norm = red*red + green*green + blue*blue;
         
         int foreground_color = 30;
         
         // Have dark grey text on light background color and light grey
         // on dark background.
         //
         if(col_norm <= 49152) {
            foreground_color = 37;
         }
         
         static const char * const empty = "";
         const char *activation_highlight = empty;
         if(simulator_core_.isKeyPressed(row, col)) {
            activation_highlight = underlined;
         }
            
         std::ostringstream o;
         o << "\x1B[48;2;" << (int)red << ";" << (int)green << ";" << (int)blue << "m"
               "\x1B[" << foreground_color << "m" 
               << activation_highlight;
         return o.str();
      }
         
      void generateLookup(KeyAddrToKeyString &lookup) {
         
         using namespace terminal_escape_sequences;
         
         uint8_t n_rows = 0, n_cols = 0;
         
         simulator_core_.getKeyMatrixDimensions(rows, cols);
         
         for(uint8_t row = 0; row < n_rows; ++row) {
            for(uint8_t col = 0; col < n_cols; ++col) {
                  
               auto key = Layer.lookupOnActiveLayer(row, col);
               
               std::string key_string("****");
               simulator_core_.getCurrentKeyLabel(row, col, key_string);
               
               std::string color_string = generateColorEscSeq(row, col);
               
               uint8_t pos = row*n_cols + col;
               
               //std::cout << (int)pos << ": color: \"" << color_string << "\", key_string: \"" << key_string << "\"\n";
               
               lookup[pos] = color_string + key_string + reset_formatting;
            }
         }
      }
      
   private:
      
      const SimulatorCore_ &simulator_core_;
};
   
void renderKeyboard(const Simulator &simulator, const char *ascii_keyboard) {
   
   KeyAddrToKeyString lookup;
   generateLookup(lookup);

   std::istringstream ss(ascii_keyboard);
   std::string line;

   std::regex re("\\{\\d+\\}");
   while(std::getline(ss,line,'\n')){

      std::string output_text;
         
      auto callback = [&](std::string const& m){
         if(m[0] == '{')
         {
            std::istringstream iss(m);
            int n;
            iss.ignore(1);
            iss >> n;
            output_text += lookup[uint8_t(n)];
         }
         else
         {
            output_text += m;
         }
      };
      
      //std::cout << "Line: " << line << std::endl;
      
      std::sregex_token_iterator
         begin(line.begin(), line.end(), re, {-1, 0}),
         end;
      std::for_each(begin,end,callback);

      simulator.log() << output_text;
    }
}

} // namespace papilio
