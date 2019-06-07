/* -*- mode: c++ -*-
 * Kaleidoscope-Testing -- A C++ testing API for the Kaleidoscope keyboard 
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

#include <string>
#include <ostream>
#include <memory>

// #include <iostream>
// #include "aux/demangle.h"

namespace kaleidoscope {
namespace testing {
   
class Simulator;
   
/// @brief An abstract assertion.
/// @details This abstract class serves as base class for any
///        assertions.
///
///        **Important:** This class is not part of Kaleidoscope-Testing's 
///                   public API. It is meant for internal use only.
///
class _Assertion {
   
   public:
      
      /// @brief Reports information about the assertion.
      ///
      /// @details Do not override this method but the method describeState instead.
      ///
      /// @param add_indent An additional indentation string.
      ///
      virtual void report(const char *add_indent = "") const;
      
      /// @brief Describes the assertion.
      ///
      /// @param add_indent An additional indentation string.
      ///
      virtual void describe(const char *add_indent = "") const = 0;

      /// @brief Evaluates the condition that is supposed to be asserted.
      /// @details Do not override this method.
      ///
      /// @return [bool] True if the assertion passed, false otherwise.
      ///
      bool eval() {
         valid_ = (this->evalInternal() != negate_); // logical XOR
         return valid_;
      }
      
      /// @brief Describes the current state of the assertion object.
      /// @details Possibly provides information about what went wrong
      ///         if the assertion failed.
      ///
      /// @param add_indent An additional indentation string.
      ///
      ///
      virtual void describeState(const char *add_indent = "") const;
   
      /// @brief Register the test simulator with the assertion.
      ///
      virtual void setDriver(const Simulator *simulator) {
         driver_ = simulator;
      }

      /// @brief Retreive the test simulator object that is associated with
      ///        the assertion.
      ///
      /// @return A pointer to the current test simulator.
      ///
      const Simulator *getDriver() const {
         return driver_;
      }
     
      /// @brief Checks validity of an assertion.
      ///
      /// @return True if valid, false otherwise.
      ///
      bool isValid() const { 
         return valid_;
      }
      
      /// @brief Set the boolean negation state of the assertion validity check.
      /// @details If negation is enabled, an assertion is assumed to be correct
      ///        if the non negated version would fail.
      ///
      /// @param state The negation state.
      ///
      void setNegate(bool state) {
         negate_ = state;
      }
      
      /// @brief Retreive the boolean negation state of the assertion validity check.
      ///
      /// @return The negation state.
      ///
      bool getNegate() const {
         return negate_;
      }
      
   protected:
            
      /// @brief Evaluates the condition that is supposed to be asserted.
      /// @details Override this method in derived assertions.
      ///
      /// @return [bool] True if the assertion passed, false otherwise.
      ///
      virtual bool evalInternal() = 0;
      
   protected:
      
      bool valid_ = false;
      const Simulator *driver_ = nullptr;
      
   private:
      
      bool negate_ = false;
};

/// @brief Negates an assertion.
/// @details Inverts the meaning of the assertion.
///
/// @param assertion The assertion to negate.
inline
std::shared_ptr<_Assertion> negate(const std::shared_ptr<_Assertion> &assertion) {
   assertion->setNegate(true);
   return assertion;
}

} // namespace testing
} // namespace kaleidoscope
      
#define KT_AUTO_DEFINE_ASSERTION_INVENTORY(WRAPPER)                            \
                                                                               \
   private:                                                                    \
      std::shared_ptr<WRAPPER::Assertion> assertion_;                          \
                                                                               \
   public:                                                                     \
      struct DelegateConstruction {};                                          \
                                                                               \
      template<typename..._Args>                                               \
      WRAPPER(DelegateConstruction, _Args...args)                              \
         : assertion_{new WRAPPER::Assertion{std::forward<_Args>(args)...}}    \
      {}                                                                       \
                                                                               \
      operator std::shared_ptr<_Assertion> () { return assertion_; }
      
#define KT_ASSERTION_STD_CONSTRUCTOR(WRAPPER)                                  \
      WRAPPER()                                                                \
         : WRAPPER(DelegateConstruction{})                                     \
      {}
