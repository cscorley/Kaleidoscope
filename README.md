# Kaleidoscope-Simulator

A development, debugging and testing API for virtual Kaleidoscope firmware builds.

## Scope of this plugin

The scope of Kaleidoscope-Simulator is to provide an API that allows to bundle
integration tests with the keyboard firmware sketch file.

Tests are executed by a virtual firmware which is a firmware 
build to run on the host platform, e.g. an x86 system, 
rather than on the actual physical keyboard.

Most parts of the physical keyboard's internal states are also represented 
in the simulated keyboard. Among those the current keymaps, LED states, EEPROM, ...
For more information, see Kaleidoscope's documentation of virtual builds.

Apart from integration testing, the supported testing-API is also 
meant to be used as a development tool.
When e.g. being used together with a debugger like `gdb`, Kaleidoscope-Simulator's 
unique features can help to deal with complex error scenarios that are otherwise
hard to debug with the firmware traditionally running on the device.

Additionally, Kaleidoscope-Simulator comes with an ASCII 
visualization of the keyboard covering keyboard keycodes and LED colors.

## A brief example

The following code snipped could be added to Kaleidoscope's stock
firmware sketch file (****.ino) to run
a very simple firmware test.

```cpp
// ... at end of the firmware file

#ifdef ARDUINO_VIRTUAL

#include "Kaleidoscope-Simulator.h"

KALEIDOSCOPE_SIMULATOR_INIT

namespace kaleidoscope {
namespace simulator {
   
void runSimulator(Simulator &simulator) {
   
   using namespace assertions;

   auto test = simulator.newTest("A simple test");

   // Have some action in order to trigger a keyboard report.
   //
   simulator.tapKey(2, 1); // (row = 2, col = 1) -> A
   
   // Run a single scan cycle (during which the key will be detected as
   // tapped and a keyboard report will be generated). Assert that the 
   // letter 'a' is part of this keyboard report
   //
   simulator.cycleExpectReports(KeycodesActive{Key_A});
}

} // namespace simulator
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
defined using Kaleidoscope-Simulator's API. 

We will walk through the test line by line.

First, we have to make sure that the compiler only sees our test in virtual firmware
builds. This is important as the simulator API can not be used in actual 
firmware builds for the target platform. That's because most target platforms resources
are simply too limited.

```cpp
#ifdef ARDUINO_VIRTUAL
```

Next, we bring the simulator API into scope.

```cpp
#include "Kaleidoscope-Simulator.h"
```

It is good custom to define code in namespaces to avoid symbol naming conflicts.

```cpp
namespace kaleidoscope {
namespace simulator {
```

The test method as the standardized name `runTest` and a pre-defined signature.
You are free to structure your tests if necessary by introducing additional
test methods which can be called from `runSimulator(...)`. Please note that the `Simulator` object
is the central object in simulation and testing. It e.g. coordinates timing and assertion handling.

```cpp
void runSimulator(Simulator &simulator) {
```
   
The `using` statement is for mere convenience as all assertion classes live in namespace 
`assertions`. Otherwise we would need to write `assertions::KeycodesActive{Key_A}`
instead of the more concise `KeycodesActive{Key_A}`.

```cpp
   using namespace assertions;
```

Next, we generate a test object. 
It's only purpose lies in its lifetime that is defined by the scope where
it is generated. It serves to group simulation and testing instructions and checks
if a set of assertions that are associated with a test are valid.

```cpp
   auto test = simulator.newTest("A simple test");
```

Tap a key at a given matrix position.

```cpp
   simulator.tapKey(2, 1); // (row = 2, col = 1) -> A
```

Finally, we run a scan cycle. This will call Arduinos `loop()`
function under the hood. During this scan cycle the keyboard matrix
is checked for keys being pressed or released. That is when our key at
position (2, 1) is detected as having been tapped and a keyboard report is 
issued. We pass an assertion `KeycodesActive` that will check if key 'a' is active 
in the generated keyboard report.

```cpp
   simulator.cycleExpectReports(KeycodesActive{Key_A});
```

That's it. Close scopes and terminate the `#ifdef ARDUINO_VIRTUAL`.

```cpp
}
} // namespace simulator
} // namespace kaleidoscope

#endif
```

## Assertions

Assertions are probably the most important aspect of Kaleidoscope-Simulators
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
assertions. The head of this queue is evaluated whenever a HID report
is generated by the firmware. After its evaluation the assertion is
removed from the queue and discarded.

While this is very useful to assert properties of individual keyboard reports, 
under other circumstances it might be useful to define assertions that
are evaluated for every report, without being discarded. Those assertions are 
referred to as _permanent assertions_.

Assertions can be queued or permanent both for both keyboard reports
and cycles. Please, check out the methods

```cpp
Simulator::reportAssertionsQueue()
Simulator::cycleAssertionsQueue()

Simulator::permanentKeyboardReportAssertions()

Simulator::permanentMouseReportAssertions()
Simulator::permanentAbsoluteMouseReportAssertions()
Simulator::permanentReportAssertions()

Simulator::permanentCycleAssertions()
```

### Assertion queueing

In most cases, the order and content of keyboard reports is known. 
In such cases a set of assertions can be added to the queue via a single command, e.g.

```cpp
simulator.reportAssertionsQueue().queue(
   KeycodesActive{Key_A}, // 1. keyboard report
   ReportEmpty{},         // 2. keyboard report
   KeycodesActive{Key_B}, // 3. keyboard report
   ReportEmpty{}          // 4. keyboard report
);
```

Every individual assertion will be applied to an individual report.

### Permanent assertions

Permanent assertions can be added and removed at any time during 
simulator execution. They are evaluated whenever a keyboard report arrives
or at the end of every cycle, respectively.

### Assertion grouping

When multiple assertions are supposed to be evaluated with respect to the same 
keyboard report,
they can be supplied via the `addGrouped(...)` method of the container returned by the premanent assertions retreival functions like e.g. `Simulator::permanentReportAssertions()` or the `queueGrouped(...)` method of the queue container returned e.g. by `Simulator::reportAssertionsQueue()`. All grouped assertions must pass (logical and) for the test to
be considered as successful.

For instance

```cpp
simulator.reportAssertionsQueue().queueGrouped(
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
simulator.reportAssertionsQueue().queueGrouped(
   KeycodesActive{Key_A}.negate()
);
```

would allow any key and modifier keycodes to be part of a keyboard report
except for key 'a'.

### Grouping and negation

If the logic of an entire group of assertions is to be inverted, they can be 
grouped explicitly and negated.

```cpp
simulator.reportAssertionsQueue().queue(
   Grouped{
      KeycodesActive{Key_A},
      KeycodesActive{Key_B}
   }.negate()
);
```

### Custom assertions

Despite the numerous predefined assertion classes that come 
with Kaleidosope-Simulator's API, under 
certain cicumstances it might still be desirable to execute custom code that expresses
an assertion. This is easily possible by passing a C++ lambda function to the 
constructor of a special `Custom...Assertion` class, e.g.

```cpp
simulator.reportAssertionsQueue().queue(
   CustomReportAssertion<KeyboardReport>{
      [&](const KeyboardReport &kr) -> bool {
         simulator.log() << "Custom keyboard report assertion triggered";
         return true;
      }
   }
);
```

**Note:** The template parameter `<KeyboardReport>` informs the assertion about what type of report to expect. The same would work with `<MouseReport>`, `<AbsoluteMouseReport>` and `<Report_>`. The latter for accessing any type of report.

The lambda function in this example actually doesn't evaluate 
any specific condition (the assertion returns the constant `true`).
But you are free to return the result of any complex test instead. 

In general the lambda function
passed to the `CustomReportAssertion` has a predefined signature
`bool(const KeyboardReport &kr)`. In the above examples it uses `[&]` to capture 
all context variables by reference. This also includes the simulator object from
the surrounding context that 
is used to generate additional log output.

Use the assertion class `CustomAssertion` for custom cycle assertions as e.g.

```cpp
simulator.cycleAssertionsQueue().queue(
   CustomAssertion{
      [&]() -> bool {
         simulator.log() << "Custom cycle assertion triggered";
         return true;
      }
   }
);
```

### Immediate assertions

Instead of when a keyboard report occurs or at the end of a cycle,
assertions may also be evaluated immediately as e.g.

```cpp
simulator.evaluateAssertions(LayerIsActive{1});
```

This example checks whether a specific layer is active. In most cases this is not 
necessary as the same condition can be checked programatically through Kaleidoscope's
proper firmware API. 

The only difference to doing so is that predefined assertions might
require less user code to do the same and your code
might be less sensitive against API changes to the Kaleidoscope core.

## Key activation

When simulating and testing, key action (press/release/tap) is the most important input 
that causes the firmware to react. 

In contrast to a real experiment where the user hits a key on the keyboard,
in a virtual keyboard run, keys are hit virtually through key action methods
of the `Simulator` class. 

While `pressKey(...)` activates
a key at a given key matrix position, `release(...)` will deactivate it.
The method `tapKey(...)` simulates a key being tapped instantaneously
(pressed and released within a single cycle).

### Multi taps

There are scenarios where a key must be tapped multiple times during a test run. 
This might e.g. be necessary if we want to simulate cycling through the LED effects of
the keyboard. On the real keyboard we would hit the 'next LED effect' key multiple times.
To simplify this, the `Simulator` class supports a dedicated method `multiTapKey(...)`.

The following example demonstrates cycling
through LED modes via multiple taps (stock firmware assumed).

```cpp
// Cycle through the color effects and visualize the keyboard's LED state
//
simulator.multiTapKey(
   15 /*num. taps*/, 
   0 /*row*/, 6/*col*/, 
   50 /* num. cycles after each tap */,
   CustomAssertion{
      [&]() -> bool {
         renderKeyboard(simulator, keyboardio::model01::ascii_keyboard);
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

Use the `Simulator` class' methods `setCycleDuration(...)` and `getCycleDuration()` to
consider cycle duration of a specific keyboard hardware.

There are different methods to progress time.

### `cycle()`

This method runs a single firmware cycle and advances time accordingly. 

### `cycleExpectReports(...)`

Same as `cycle()` but it accepts a number of assertions that are 
evaluated for the keyboard reports that are generated during the cycle.

### `cycles(...)`

This method runs a number of firmware cycles and advances time accordingly.

### `advanceTimeTo(...)`

The simulator processes cycles until it reaches a specific point in time.

### `advanceTimeBy(...)`

Runs a number of cycles with a given total duration.

## Logging

The simulator API supports several logging methods. All log output is written
to a common `std::ostream` object. This stream object can be queried and registered
through the `Simulator` class' methods `getOStream()` and `setOStream(...)`.

Every log line starts with information about the current time and
firmware cycle ID.

FWIW, there's no need to pass `std::endl` or `"\n"` to any of the logging functions.
Line breaks are inserted automatically.

### Normal logging

Standard log text can be generated for instance as

```cpp
simulator.log() << "Text ... " << 12 << ...;
```

This will e.g. generate

```
t=5750, c=1150: Text ... 12
```

in the log output.

Log stream output works exactly as with `std::ostream` of C++'s standard library.

### Error logging

For error logging use `simulator.error()` instead, e.g. as

```cpp
simulator.error() << "Something bad happened...";
```

This will e.g. generate

```
t=5770, c=1154: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Error !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
t=5770, c=1154: !!! Something bad happened...
t=5770, c=1154: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
```

in the log output.

### Header text

Use `simulator.header()` to generate text headers.

```cpp
simulator.header() << "And now for something completely different...";
```

This will e.g. generate

```
t=5770, c=1154: ########################################################
t=5770, c=1154: ### And now for something completely different...
t=5770, c=1154: ########################################################
```

in the log output.

## Verifying LED states

Kaleidoscope-Simulator comes with functions that help integration testing of 
LED modes.

During a reference run the function `dumpKeyLEDState()` may be used 
to generate the C++ code of a pre-initialized array that represents the current
state of the per-key LEDs.

The generated code of the array can then be used to defined a LED state
verification test using `assertKeyLEDState(...)`. This enables to assert
that the per-key LEDs are at a given color-state at a specific
time during future test-runs.

## Visualization

During development and when debugging it may be of great help to visualize
what the actual keyboard would do, especially when it comes to LED effects.

Kaleidoscope-Simulator allows to display an ASCII-text representation of the
keyboard via the `renderKeyboard(...)` function.

This function is passed a string that is a template of the actual keyboard.

At the time this document was written, only for Keyboardio's model Model01, 
the first Kaleidoscope-supporting keyboard, a predefined template string
was shipped with Kaleidoscope-Simulator (see `vendors/keyboardio/model01.cpp`).

```cpp
// In the firmware sketch file

#ifdef ARDUINO_VIRTUAL

#include "Kaleidoscope-Simulator.h"
#include "vendors/keyboardio/model01.h"
...
renderKeyboard(simulator, keyboardio::model01::ascii_keyboard);
```

![Keyboard heatmap](/doc/images/Model01_screenshot.png?raw=true)

### Realtime simulation

Kaleidoscope-Simulator can simulate the
keyboard in realtime. Realtime means that the simulator runs approximately at
the same speed as the real keyboard hardware would run.

There are two methods of the simulator class that enable this.

#### `runRealtime(...)`

Runs the simulator in pseudo-realtime for a given amount of time. A function
that is passed as a parameter is executed after every scan cycle.

We refer to _pseudo-realtime_ here as the duration of a cycle is defined
as a constant via the configuration method `setCycleDuration(...)`.

On the real keyboard, in contrast, the duration of a cycle depends on the actual 
computational task of each cycle which is unknown to the simulator.

The host hardware is typically much faster than the device hardware. Because of
this the host inserts idle time after executing a cycle's computational task
to ensure that the resulting cycle times are as expected.

#### `runRemoteControlled(...)`

In this mode of operation, the simulator reads keyswitch information from stdin at the 
beginning of every cycle. Keyswitch activation information is typically generated by the
[Kaleidoscope-Simulator-Control](https://github.com/CapeLeidokos/Kaleidoscope-Simulator-Control)
plugin running on the device. That way it is possible to use the physical 
keyboard to generate realtime keyswitch input for the simulator.

The simulator waits for new input to arrive at the beginning of each cycle.
On the other hand, the physical keyboard also sends the state of its keyswitches
once per cycle. This allows the timing of the simulator
to be close to that of the real hardware.

Remote controlled simulation is useful to prototype new LED modes that
react on user input. In contrast to running traditional compile-flash-test-modifiy cycles,
there is no flashing and all the nice debugging features of the keyboard simulator 
are available.

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

In the initial example we just defined a single test function `runSimulator(...)`.
To structure individual tests, it can be beneficial to define an individual function
for each test.

```cpp
...
void test1(Simulator &simulator) {
   ...
}
void test2(Simulator &simulator) {
   ...
}

void runSimulator(Simulator &simulator) {
   test1(simulator);
   test2(simulator);
}
```

With this approach it is more convenient to temporarily enable/disable
tests by uncommenting/commenting the individual test function invokations. 

## Examples

There are several examples demonstrating Kaleidoscope-Simulator's features
and how to use the API. All examples reside in the `examples` directory tree.

To run an example, enter the following in your console window.

```
cd examples

make <relative path to subdirectory containing a tests.h file>
```

## Doxygen documentation

To generate Kaleidoscope-Simulator's API documentation with [doxygen](http://doxygen.nl/)
make sure doxygen is installed on you unixoid system (GNU/Linux & macOS) and run

```
make doc
```

in the root directory of plugin Kaleidoscope-Simulator.
