# Kaleidoscope-Testing

A development, debugging and testing API for virtual Kaleidoscope firmware builds.

## Scope of this plugin

The scope of Kaleidoscope-Testing is to provide an API that allows to bundle
integration tests with the keyboard firmware sketch file.

Apart from integration testing, the API provided can also be used for development.
Its various assertion classes can be used together with a debugger like gdb
to debug complex error scenarios.

The plugin comes with a terminal window visualization of keyboard keycodes
and LEDs. By means of this feature, it is possible to directly see the 
current key maps and the state of the per-key LEDs at any time during a
simulated firmware run.

Virtual firmwares are representations of the firmware that are build for the 
host plaftorm, e.g. an x86 system, rather than for the actual keyboard.
Most parts of the keyboards internal states are covered by the simulated 
keyboard, most importantly, the current keymaps, LED states, EEPROM, ...
For more information, see Kaleidoscope's documentation of virtual builds.

## A brief example

The following code could be added to a firmware sketch file (****.ino) to run
a very simple firmware test (with the stock firmware).

```cpp
#ifdef ARDUINO_VIRTUAL

#include "Kaleidoscope-Testing.h"

KALEIDOSCOPE_TESTING_INIT

namespace kaleidoscope {
namespace testing {
   
void runTests(Driver &driver) {
   
   using namespace assertions;

   auto test = driver.newTest("A simple test");
      
   // Add an assertion to the next keyboard report that will be 
   // issued.
   //
   driver.queuedKeyboardReportAssertions().add(KeycodesActive{Key_A});
      
   driver.tapKey(2, 1); // (row = 2, col = 1) -> A
   
   // Run a single scan cycle (during which the key will be detected as
   // tapped and a keyboard report will be generated).
   //
   driver.cycle();
}
} // namespace testing
} // namespace kaleidoscope

#endif
```

This test checks if a keycode for the letter 'a' is present in a keyboard
report when the key at matrix position (row = 2, col = 1) is tapped 
(pressed and immediately released). 

The test implies the standard QWERTY keyboard layout to be used where the 
letter 'a' is assigned to the respective key matrix position on layer 0.

Although this is a very simple test, it could already catch multiple types
of firmware programming issues, e.g. keymapping problems or reports not being
generated.

## A simple test in greater detail

Let's look again at the simple test example, now with focus on the way the test is
specified. We will go through the test line by line.

```cpp
#ifdef ARDUINO_VIRTUAL
```
We have to make sure that the compiler only sees our test in virtual firmware
builds. This is important as the testing API can not be used in actual 
firmware builds for the target platform. Most target platforms resources
are simply too limited.

```cpp
#include "Kaleidoscope-Testing.h"
```
Bring the testing API into scope.

```cpp
namespace kaleidoscope {
namespace testing {
```
It is good custom to define code in namespaces to avoid symbol naming conflicts.

```cpp
void runTests(Driver &driver) {
```
The test method must be called `runTest` and have the displayed signature.
You are free to structure your tests if necessary by introducing additional
test methods that are called from `runTests(...)`. The `Driver` object
is the central object in testing. It coordinates timing and assertion handling.
   
```cpp
   using namespace assertions;
```
This is for mere convenience as all assertion classes live in namespace 
`assertions`. Otherwise we would need to write `assertions::KeycodesActive{Key_A}`
in one of the following lines.

```cpp
   auto test = driver.newTest("A simple test");
```
This generates a test object. This test object does not have any methods.
It's only purpose lies in its lifetime that is defined by the scope where
it is generated. Via its contructor and destructor methods the
test object takes care to output a nice text header
in the generated console output and checks if a test was successful.
Most importantly, it serves to group testing instructions, as we will see
later on in this document.
      
```cpp
   driver.queuedKeyboardReportAssertions().add(KeycodesActive{Key_A});
```
Adds an assertion that checks if key a is active 
in the next keyboard report. Assertions are stored in a queue where
the head of the queue is always evaluated for the next incoming keyboard report.

```cpp
   driver.tapKey(2, 1); // (row = 2, col = 1) -> A
```
Tap a key by defining its matrix position.
   
```cpp
   driver.cycle();
```
Run a scan cycle. This basically boils down to calling Arduinos `loop()`
function.

```cpp
}
} // namespace testing
} // namespace kaleidoscope

#endif
```
Close scopes and terminate the `#ifdef ARDUINO_VIRTUAL`.

## Assertions

Assertions are mostly boolean conditions that are evaluated at specific
points during the firmware simulation. If an assertion fails, an error
message is produced and the test is considered as failed. Assertions can
check literaly everything that can be checked programatically. For some common
conditions, predefined assertion classes are provided. Anything else can
be defined by supplying callback functions to custom assertions.

See the doxygen API documentation for more information about all available assertions.

### Keyboard report assertions

As their name tells, those assertions apply to keyboard reports and 
analyze and ensure specific properties of such reports.

_As a sidenote: Keyboard reports are those sets of information that a keyboard
sends to the host system. They can contain information about keycodes or
modifiers being active._

### Cycle assertions

This type of assertions is evaluated at the end of a firmware scan cycle.

### Queued vs. permanent assertions

In the above example we queued a keyboard report assertion. This assertion 
is evaluated when the next keyboard report is generated. Afterwards it is 
discarded.

Under other circumstances it might be useful to define assertions that
are evaluated every time, without being discarded. Those assertions are 
referred to as _permanent assertions_.

There are both queued assertions and permanent assertions for both keyboard reports
and cycles. Check out the methods

```cpp
queuedKeyboardReportAssertions()
permanentKeyboardReportAssertions()
queuedCycleAssertions()
permanentCycleAssertions()
```

of the simulation `Driver` class.

### Assertion queueing

In most cases, there are specific expectations about keyboard reports being 
generated in a known order and with known content. In such cases a set of 
assertions can be added to the queue via a single command, e.g.

```cpp
driver.queuedKeyboardReportAssertions().add(
   KeycodesActive{Key_A}, // 1. keyboard report
   ReportEmpty{},         // 2. keyboard report
   KeycodesActive{Key_B}, // 3. keyboard report
   ReportEmpty{}          // 4. keyboard report
);
```

Every individual assertion will be apply to an individual report.

### Permanent assertions

Permanent assertions can be added and removed at any time during 
testing execution.

### Assertion grouping

When multiple assertions are supposed to be evaluated for the same report,
they can be supplied via the `addGrouped(...)` method of the `AssertionQueue`
class that is returned e.g. by `queuedKeyboardReportAssertions()`. All
grouped assertions must pass (logical and).

For instance

```cpp
driver.queuedKeyboardReportAssertions().addGrouped(
   KeycodesActive{Key_A},
   KeycodesActive{Key_B}
);
```

would expect both keys 'a' and 'b' be part of the next keyboard report.

### Negating assertions

Assertions are boolean conditions. It can sometimes make sense to 
invert their logic. 

For instance

```cpp
driver.queuedKeyboardReportAssertions().addGrouped(
   negate(KeycodesActive{Key_A})
);
```

would allow any key and modifier keycodes to be part of a keyboard report
except for the 'a' key.

### Grouping and negation

If the logic of an entire group of assertions is to be inverted, they can be 
grouped explicitly and negated.

```cpp
driver.queuedKeyboardReportAssertions().add(
   negate(
      Grouped{
         KeycodesActive{Key_A},
         KeycodesActive{Key_B}
      }
   )
);
```

### Custom assertions

Despite the numerous predefined assertion classes, it might under 
certain cicumstances be desirable to execute custom code that represents
an assertion. This is easily possible by passing a C++ lambda function as an assertion, e.g.

```cpp
driver.queuedKeyboardReportAssertions().add(
   CustomKeyboardReportAssertion{
      [&](const KeyboardReport &kr) -> bool {
         driver.log() << "Custom keyboard report assertion triggered";
         return true;
      }
   }
);
```

In this example nothing is actually evaluated (the assertion returns the constant `true`).
But it is probably easy to see what could be done. The lambda function
passed to the `CustomKeyboardReportAssertion` has a predefined signature
`bool(const KeyboardReport &kr)`. In the examples it uses `[&]` to capture 
all context variables by reference. This includes the driver object that 
is used to generate additional log output.

There's also a assertion class `CustomAssertion` that can be used
for cycle assertions, e.g.

```cpp
driver.queuedCycleAssertions().add(
   CustomAssertion{
      [&]() -> bool {
         driver.log() << "Custom cycle assertion triggered";
         return true;
      }
   }
);
```

### Immediate assertions

Assertions can also be evaluated immediately as e.g.

```cpp
driver.evaluateAssertions(LayerIsActive{1});
```

This checks if a specific layer is active. In most cases this is not 
necessary as the same can be checked programatically through Kaleidoscopes
own firmware API. The only difference that predefined assertions might
require less code to do the same and tests might be less sensitive
against API changes to the Kaleidoscope core.

## Key activation

Keys are activated via methods of the `Driver` class. While `pressKey(...)` activates
a key at a given key matrix position, `release(...)` will deactivate the key.
The method `tapKey(...)` will simulate a key being tapped a very short time.

### Multi taps

There are scenarios where tapping a key multiple times might be needed
as part of a test. E.g. if we want to cycle through the color effects of
the keyboard, we would hit a dedicated key multiple times.

The following example demonstrates for the stock firmware how one could
cycle through the LED modes via multiple taps.

```cpp
// Cycle through the color effects and visualize the keyboard's LED state
//
driver.multiTapKey(
   15 /*num. taps*/, 
   0 /*row*/, 6/*col*/, 
   50 /* num. cycles after each tap */,
   CustomAssertion{
      [&]() -> bool {
         renderKeyboard(driver, keyboardio::model01::ascii_keyboard);
         return true;
      }
   }
);
```

This example does the following. It simulates the LED effect cycle key (row = 0,
col = 6) being tapped 15 times. After each tap 50 cycles are run and 
a `CustomAssertion` is executed.

## Timing

The virtual hardware comes with a simulated timing. As it is impossible to estimate
the actual runtime of a loop scan cycle on the target hardware, a fixed 
time increment is associated with each loop cycle (default = 5 ms).

Use the `Driver`'s methods `setCycleDuration(...)` and `getCycleDuration()` to
adapt duration to a specific keyboard hardware.

There are different methods to run forward in time.

### `cycle(...)`

This method runs a single firmware cycle. Time is advanced accordingly. 

### `cycles(...)`

This method runs a number of firmware cycles and advances time accordingly.

### `cycleTo(...)`

The simulator processes cycles until a specific point in time is reached.

### `advanceTime(...)`

Runs a number of cycles whose overall duration is defined by a function parameter.

## Logging

The testing API supports several logging methods. All log output is written
to a common `std::ostream` object. An ostream can be queried and registered
by the driver's methods `getOStream()` and `setOStream(...)`.

All log lines start with information about the current time and
firmware cycle ID.

There's no need to pass `std::endl` or `"\n"` to any of the logging functions.
Line breaks are inserted automatically.

### Normal logging

Standard log text can be generated as

```cpp
driver.log() << "Text" << 12 << ...;
```

Log stream output works exactly as a ordinary `std::ostream`.

### Error logging

Use `driver.error()` instead as

```cpp
driver.error() << "Something bad happened...";
```

### Header text

Use `driver.header()` to generate text headers.

```cpp
driver.header() << "And now for something completely different...";
```

## Visualization

During development and when debugging in often greatly helps to visualize
what the actual keyboard would do, especially when it comes to LED effects.

Kaleidoscope-Testing allows to display an ascii-text visualization of the
keyboard. This is done via the `renderKeyboard(...)` function.

The function is passed a string that represents a template of the actual keyboard.
At the time this document is written, only for Keyboardio's model Model01, 
the first Kaleidoscope-supporting keyboard, a predefined template string
is shipped with Kaleidoscope-Testing. 

```cpp
// In the firmware sketch file

#ifdef ARDUINO_VIRTUAL

#include "Kaleidoscope-Testing.h"
#include "vendors/keyboardio/model01.h"
...
renderKeyboard(driver, keyboardio::model01::ascii_keyboard);
```

### Custom keyboards

It is very easy to define a custom template string for any keyboard.

The template string may contain tokens `{xxxx}` where `xxxx` is an integer number
that equals `row*matrix_colums + col` for the `(row, col)` tuple of a key.
Any such strings, when encountered in the template string are replaced by
the keycode that the respective key would currently generate. The key
is colored in the same way as its key LED (if there are key LEDs present).

## Structuring tests

In the initial example we just defined a single test function `runTests(...)`.
To structure individual tests, it can be beneficial to define an individual function
for each test.

```cpp
...
void test1(Driver &driver) {
   ...
}
void test2(Driver &driver) {
   ...
}

void runTests(Driver &driver) {
   test1(driver);
   test2(driver);
}
```

With this approach it is more convenient to temporarily enable/disable
tests by uncommenting/commenting the individual test function invokations. 

## Examples

There is an example sketch `examples/all_assertions/all_assertions.ino`
that exemplifies most features of Kaleidoscope-Testing's
API. 

## Doxygen documentation

To generate Kaleidoscope-Testing's APi documentation with [doxygen](http://doxygen.nl/)
make sure doxygen is installed on you unixoid system (GNU/Linux & macOS) and run

```
make doc
```

in the root directory of plugin Kaleidoscope-Testing.
