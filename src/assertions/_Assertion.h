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

namespace kaleidoscope {
namespace testing {
   
class TestDriver;
   
/** class _Assertion
 *  brief An abstract assertion.
 *  details This abstract class serves as base class for any
 *          assertions.
 */
class _Assertion {
   
   public:
      
      /** brief Reports information about the assertion.
       * 
       * details Do not override this method but the method describeState instead.
       *
       * param out The target output stream
       * param add_indent An additional indent string
       * 
       * return void
       */
      virtual void report(std::ostream &out, const char *add_indent = "") const {
   
         if(this->valid_) {
            out << add_indent << typeid(*this).name() << " assertion passed: ";
            this->describe(out);
            out << std::endl;
         }
         else {
            out << add_indent << "!!! " << typeid(*this).name() << " assertion failed: ";
            this->describe(out);
            out << std::endl;
            out << add_indent << "   actual:" << std::endl;
            std::string indent = std::string(add_indent) + "      ";
            this->describeState(out, indent.c_str());
         }
      }
      
      /** brief Describes the assertion.
       * 
       * param out The target output stream
       * param add_indent An additional indent string
       * 
       * return void
       */
      virtual void describe(std::ostream, const char *add_indent = "") const = 0;

      /** brief Evaluates the condition that is supposed to be asserted.
       * details Do not override this method.
       * 
       * return bool True if the assertion passed, false otherwise.
       */
      bool eval() {
         
         valid_ = this->evalInternal() ^ negate_;
         return valid_;
      }
      
      /** brief Describes the current state of the assertion
       *        object and possibly provides information about what went wrong
       *        if the assertion failed.
       * 
       * param out The target output stream
       * param add_indent An additional indent string
       * 
       * return void
       */
      virtual void describeState(std::ostream &out, const char *add_indent = "") const {
         out << add_indent;
         if(valid_) {
            out << "valid";
         }
         else {
            out << "failed";
         }
      }
   
      /** brief Register the test driver with the assertion.
       * 
       * return void
       */
      virtual void setTestDriver(const TestDriver *test_driver) {
         test_driver_ = test_driver;
      }

      /** brief Register the test driver with the assertion.
       * 
       * return A pointer to the current test driver
       */
      const TestDriver *getTestDriver() const {
         return test_driver_;
      }
     
      /** brief Checks validity of an assertion.
       * 
       * return True if valid, false otherwise.
       */
      bool isValid() const { 
         return valid_;
      }
      
      /** brief Set the boolean negation state of the assertion validity check.
       * 
       * param state The negation state.
       */
      void setNegate(bool state) {
         negate_ = state;
      }
      
      /** brief Set the boolean negation state of the assertion validity check.
       * 
       * return The negation state.
       */
      bool getNegate() const {
         return negate_;
      }
      
   protected:
            
      /** brief Evaluates the condition that is supposed to be asserted.
       * details Override this method in derived assertions.
       * 
       * return bool True if the assertion passed, false otherwise.
       */
      virtual bool evalInternal() = 0;
      
   private:
      
      bool valid_;
      const TestDriver *test_driver_ = nullptr;
};

std::shared_ptr<_Assertion> negate(std::shared_ptr<_Assertion> &assertion) {
   assertion->setNegate(true);
   return assertion;
}

} // namespace testing
} // namespace kaleidoscope
      
#define KS_TESTING_ASSERTION_WRAPPER(WRAPPER)                                  \
                                                                               \
   private:                                                                    \
      std::shared_ptr<Assertion> assertion_;                                   \
                                                                               \
   public:                                                                     \
      template<typename..._Args>                                               \
      WRAPPER(_Args args)                                                      \
         : assertion_{new Assertion{std::forward<_Args>(args)...}}             \
      {}                                                                       \
                                                                               \
      std::shared_ptr<_Assertion> operator() { return assertion_; }
