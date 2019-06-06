# Kaleidoscope-Testing

A development, debugging and testing API for virtual Kaleidoscope firmware builds.

## Scope of this plugin

The scope of Kaleidoscope-Testing is to provide an API that allows to bundle
integration tests with the keyboard firmware sketch file.

Tests are executed by a virtual firmware which is a firmware 
build to run on the host platform, e.g. an x86 system, 
rather than on the actual physical keyboard.

Most parts of the physical keyboard's internal states are also represented 
in the simulated keyboard. Among those the current keymaps, LED states, EEPROM, ...
For more information, see Kaleidoscope's documentation of virtual builds.

Apart from integration testing, the supported testing-API is also 
meant to be used as a development tool.
When e.g. being used together with a debugger like `gdb`, Kaleidoscope-Testing's 
unique features can help to deal with complex error scenarios that are otherwise
hard to debug with the firmware traditionally running on the device.

Additionally, Kaleidoscope-Testing comes with an ASCII 
visualization of the keyboard covering keyboard keycodes and LED colors.

## A brief example

The following code snipped could be added to Kaleidoscope's stock
firmware sketch file (****.ino) to run
a very simple firmware test.

```cpp
// ... at end of the firmware file

#ifdef ARDUINO_VIRTUAL

#include "Kaleidoscope-Testing.h"

KALEIDOSCOPE_TESTING_INIT

namespace kaleidoscope {
namespace testing {
   
void runTests(Driver &driver) {
   
   using namespace assertions;

   auto test = driver.newTest("A simple test");
      
   // Assert that the letter 'a' is part of the next keyboard report
   // that is going to be generated.
   //
   driver.queuedKeyboardReportAssertions().add(KeycodesActive{Key_A});
      
   // Have some action in order to trigger a keyboard report.
   //
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

This very simple test checks if a keycode for the letter 'a' is present in a keyboard
report that is generated as a reaction on a key at matrix position (row = 2, col = 1) being tapped 
(pressed and immediately released). 

This test implies the standard QWERTY keyboard layout to active for the 
letter 'a' being associated with the key at the respective matrix position on layer 0.

Although a very simple test, it could already catch multiple types
of firmware programming issues, among those keymapping problems or reports accidentally not being
generated.

## A simple test in greater detail

Let's look again at the above example, now with focus on the way the test is
defined using Kaleidoscope-Testing's API. 

We will walk through the test line by line.

First, we have to make sure that the compiler only sees our test in virtual firmware
builds. This is important as the testing API can not be used in actual 
firmware builds for the target platform. That's because most target platforms resources
are simply too limited.

```cpp
#ifdef ARDUINO_VIRTUAL
```

Next, we bring the testing API into scope.

```cpp
#include "Kaleidoscope-Testing.h"
```

It is good custom to define code in namespaces to avoid symbol naming conflicts.

```cpp
namespace kaleidoscope {
namespace testing {
```

The test method as the standardized name `runTest` and a pre-defined signature.
You are free to structure your tests if necessary by introducing additional
test methods which can be called from `runTests(...)`. Please note that the `Driver` object
is the central object in testing. It e.g. coordinates timing and assertion handling.

```cpp
void runTests(Driver &driver) {
```
   
The `using` statement is for mere convenience as all assertion classes live in namespace 
`assertions`. Otherwise we would need to write `assertions::KeycodesActive{Key_A}`
instead of the more concise `KeycodesActive{Key_A}`.

```cpp
   using namespace assertions;
```

Next, we generate a test object. 
It's only purpose lies in its lifetime that is defined by the scope where
it is generated. It serves to group testing instructions an checks
if a set of assertions that are associated with a test are valid.

```cpp
   auto test = driver.newTest("A simple test");
```

Then, we add an assertion that will check if key 'a' is active 
in the next keyboard report that is going to be issued during
the next keyboard scan cycle.
      
```cpp
   driver.queuedKeyboardReportAssertions().add(KeycodesActive{Key_A});
```

Tap a key at a given matrix position.

```cpp
   driver.tapKey(2, 1); // (row = 2, col = 1) -> A
```

Finally, we run a scan cycle. This will call Arduinos `loop()`
function under the hood. During this scan cycle the keyboard matrix
is checked for keys being pressed or released. It is when our key at
position (2, 1) is detected as having been tapped and a keyboard report is 
issued.

```cpp
   driver.cycle();
```

That's it. Close scopes and terminate the `#ifdef ARDUINO_VIRTUAL`.

```cpp
}
} // namespace testing
} // namespace kaleidoscope

#endif
```

## Assertions

Assertions are probably the most important aspect of Kaleidoscope-Testings
API. They are boolean conditions that are evaluated at specific
points during the firmware simulation. If an assertion fails, an error
message is produced and the test is considered as unsuccessfull.

Assertions can
check literaly everything what can also be checked programatically. For some common
conditions, however, predefined assertion classes are provided for the sake of convenience. 
By supplying callback functions to custom assertions (described in detail later on in this document)
it is possible to define arbitrarily complex assertions.

See the doxygen API documentation for more information about available assertion classes.

### Keyboard report assertions

As the name tells, those assertions analyze keyboard reports
ensure specific properties of those.

_As a sidenote: Keyboard reports are those sets of information that a keyboard
sends to the host system. They can contain information about keycodes or
modifiers being active._

### Cycle assertions

This type of assertions is evaluated at the end of firmware scan cycles.

### Queued vs. permanent assertions

In the above example we added a keyboard report assertion to a queue of 
assertions. The head of this queue is evaluated whenever a keyboard report
is generated by the firmware. After its evaluation the assertion is
removed from the queue and discarded.

While this is very useful to assert properties of individual keyboard reports, 
under other circumstances it might be useful to define assertions that
are evaluated for every report, without being discarded. Those assertions are 
referred to as _permanent assertions_.

Assertions can be queued or permanent both for both keyboard reports
and cycles. Please, check out the methods

```cpp
Driver::queuedKeyboardReportAssertions()
Driver::permanentKeyboardReportAssertions()
Driver::queuedCycleAssertions()
Driver::permanentCycleAssertions()
```

### Assertion queueing

In most cases, the order and content of keyboard reports is known. 
In such cases a set of assertions can be added to the queue via a single command, e.g.

```cpp
driver.queuedKeyboardReportAssertions().add(
   KeycodesActive{Key_A}, // 1. keyboard report
   ReportEmpty{},         // 2. keyboard report
   KeycodesActive{Key_B}, // 3. keyboard report
   ReportEmpty{}          // 4. keyboard report
);
```

Every individual assertion will be applied to an individual report.

### Permanent assertions

Permanent assertions can be added and removed at any time during 
testing execution. They are evaluated whenever a keyboard report arrives
or at the end of every cycle, respectively.

### Assertion grouping

When multiple assertions are supposed to be evaluated with respect to the same 
keyboard report,
they can be supplied via the `addGrouped(...)` method of the `AssertionQueue`
class. All grouped assertions must pass (logical and) for the test to
be considered as successful.

For instance

```cpp
driver.queuedKeyboardReportAssertions().addGrouped(
   KeycodesActive{Key_A},
   KeycodesActive{Key_B}
);
```

would expect both keys 'a' and 'b' to be part of the next upcoming keyboard report.

### Negating assertions

Assertions are boolean conditions. Sometimes you will want to 
invert their logic. 

For instance

```cpp
driver.queuedKeyboardReportAssertions().addGrouped(
   negate(KeycodesActive{Key_A})
);
```

would allow any key and modifier keycodes to be part of a keyboard report
except for key 'a'.

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

Despite the numerous predefined assertion classes that come 
with Kaleidosope-Testing's API, under 
certain cicumstances it might still be desirable to execute custom code that expresses
an assertion. This is easily possible by passing a C++ lambda function to the 
constructor of a special `Custom...Assertion` class, e.g.

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

The lambda function in this example actually doesn't evaluate 
any specific condition (the assertion returns the constant `true`).
But you are free to return the result of any complex test instead. 

In general the lambda function
passed to the `CustomKeyboardReportAssertion` has a predefined signature
`bool(const KeyboardReport &kr)`. In the above examples it uses `[&]` to capture 
all context variables by reference. This also includes the driver object from
the surrounding context that 
is used to generate additional log output.

Use the assertion class `CustomAssertion` for custom cycle assertions as e.g.

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

Instead of when a keyboard report occurs or at the end of a cycle,
assertions may also be evaluated immediately as e.g.

```cpp
driver.evaluateAssertions(LayerIsActive{1});
```

This example checks whether a specific layer is active. In most cases this is not 
necessary as the same condition can be checked programatically through Kaleidoscope's
proper firmware API. 

The only difference to doing so is that predefined assertions might
require less user code to do the same and the generated testing code
might be less sensitive against API changes to the Kaleidoscope core.

## Key activation

When testing, key action (press/release/tap) is the most important input 
that causes the firmware to react. 

In contrast to a real experiment where the user hits a key on the keyboard,
in a virtual keyboard run, keys are hit virtually through key action methods
of the `Driver` class. 

While `pressKey(...)` activates
a key at a given key matrix position, `release(...)` will deactivate it.
The method `tapKey(...)` simulates a key being tapped instantaneously
(pressed and released within a single cycle).

### Multi taps

There are scenarios where a key must be tapped multiple times during a test run. 
This might e.g. be necessary if we want to simulate cycling through the LED effects of
the keyboard. On the real keyboard we would hit the 'next LED effect' key multiple times.
To simplify this, the `Driver` class supports a dedicated method `multiTapKey(...)`.

The following example demonstrates cycling
through LED modes via multiple taps (stock firmware assumed).

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
col = 6) being tapped 15 times. After each tap 50 cycles elapse and 
a `CustomAssertion` is executed every time. 

This exaple uses the function `renderKeyboard`. Please read the section about visualization for
more information on rendering the keyboard.

## Timing

The virtual hardware comes with simulated timing. As it is impossible to estimate
the actual runtime of a loop scan cycle on the target hardware, a fixed 
time increment must be associated with each loop cycle (default = 5 ms).

Use the `Driver` class' methods `setCycleDuration(...)` and `getCycleDuration()` to
consider cycle duration of a specific keyboard hardware.

There are different methods to progress time.

### `cycle(...)`

This method runs a single firmware cycle and advances time accordingly. 

### `cycles(...)`

This method runs a number of firmware cycles and advances time accordingly.

### `cycleTo(...)`

The simulator processes cycles until it reaches a specific point in time.

### `advanceTime(...)`

Runs a number of cycles with a given total duration.

## Logging

The testing API supports several logging methods. All log output is written
to a common `std::ostream` object. This stream object can be queried and registered
through the `Driver` class' methods `getOStream()` and `setOStream(...)`.

Every log line starts with information about the current time and
firmware cycle ID.

FWIW, there's no need to pass `std::endl` or `"\n"` to any of the logging functions.
Line breaks are inserted automatically.

### Normal logging

Standard log text can be generated for instance as

```cpp
driver.log() << "Text ... " << 12 << ...;
```

This will e.g. generate

```
t=5750, c=1150: Text ... 12
```

in the log output.

Log stream output works exactly as with `std::ostream` of C++'s standard library.

### Error logging

For error logging use `driver.error()` instead, e.g. as

```cpp
driver.error() << "Something bad happened...";
```

This will e.g. generate

```
t=5770, c=1154: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Error !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
t=5770, c=1154: !!! Something bad happened...
t=5770, c=1154: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
```

in the log output.

### Header text

Use `driver.header()` to generate text headers.

```cpp
driver.header() << "And now for something completely different...";
```

This will e.g. generate

```
t=5770, c=1154: ########################################################
t=5770, c=1154: ### And now for something completely different...
t=5770, c=1154: ########################################################
```

in the log output.

## Visualization

During development and when debugging it may be of great help to visualize
what the actual keyboard would do, especially when it comes to LED effects.

Kaleidoscope-Testing allows to display an ASCII-text representation of the
keyboard via the `renderKeyboard(...)` function.

This function is passed a string that is a template of the actual keyboard.

At the time this document was written, only for Keyboardio's model Model01, 
the first Kaleidoscope-supporting keyboard, a predefined template string
was shipped with Kaleidoscope-Testing (see `vendors/keyboardio/model01.cpp`).

```cpp
// In the firmware sketch file

#ifdef ARDUINO_VIRTUAL

#include "Kaleidoscope-Testing.h"
#include "vendors/keyboardio/model01.h"
...
renderKeyboard(driver, keyboardio::model01::ascii_keyboard);
```

### Custom keyboards

It is quite easy to define a custom template string for any keyboard.

Appart from any ASCII art that represents the keyboard hardware, 
the template may contain tokens `{xxxx}` where `xxxx` is an integer number
that equals the expression `row*matrix_colums + col` being evaluated
for a key's `(row, col)` tuple.
Any such tokens, when encountered in the template are automatically replaced by
information about the keycode that the respective key would currently generate. The key
is colored in the same way as its key LED (if there are key LEDs present).

Please note that any `{xxxxx}` token is replaced by exactly four visible characters
no matter how wide in terms of characters its appearance in the template string.

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
that demonstrates most features of Kaleidoscope-Testing's
API. 

## Doxygen documentation

To generate Kaleidoscope-Testing's API documentation with [doxygen](http://doxygen.nl/)
make sure doxygen is installed on you unixoid system (GNU/Linux & macOS) and run

```
make doc
```

in the root directory of plugin Kaleidoscope-Testing.
