# Aglais

An I/O recorder data format, library and tools for USB-HID reporting keyboards.

## Introduction

A USB-keyboard communicates with the host system via HID reports. Those are
created when keys are pressed or released. More complex keyboards are registering
at the host system as traditional keyboards but also as mouse devices or even absolute mouse devices at the same time. For the latter there are also dedicated HID reports that are send as a reaction to key-action.

To debug the behavior of a keyboard firmware, it is very important to keep
track of the exact sequence of key-actions and HID-reports being send.

Aglais defines a data format for storing and reading the I/O transactions. It enables a keyboard firmware to send the I/O information e.g. via a serial interface to the host system. 

Aglais comes with a tool `aglais_convert` that enables compressing files and 
converting them from a compact text-based form to a verbose text-based form.
The tool also allows to conveniently convert Aglais-documents into a form
that can be integrated in any C++ program to be read by Aglais' interface library.

## Reading Aglais files

To read aglais files you can either build Aglais as standalone tool or 
you can link it into other programs.

### Building the standalone library and tools

Aglais build system works based on CMake. To build it, do the following.

```
cd <some_place_to_clone_aglais>
git clone https://github.com/CapeLeidokos/Aglais.git

cd <some_build_dir>
cmake <some_place_to_clone_aglais>/Aglais
make
```

### Interfacing Aglais

To use Aglais with your own code, link it to `libaglais.so` and 
reimplement the consumer class `aglais::Consumer_`.

## Converting Aglais files

To convert aglais files, use the tool `aglais_convert`. See the output
of `aglais_convert -h` for more information.

## Generating Aglais files autonomously

See the grammar of the Aglais data files in `src/v1/Grammar.h` 
for a description of the data format and the data types involved.

## Aglais document formats

There are currently two versions of aglais documents, both are text based.

### Verbose documents

The verbose version of Aglais documents is human-readable and thus
good for debugging. The following is an example of the syntax.

```
1 1
firmware_id "an identifier string"
start_cycle 0 103
end_cycle 0 5165
cycles 1 5165 2 1 9 
start_cycle 3 5175
action key_pressed 2 14
reaction hid_report 8 29 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
end_cycle 3 5180
cycles 4 5180 26 8 1 9 1 2 2 9 2 1 2 2 8 2 2 2 1 9 2 3 2 9 1 2 2 2 9 
start_cycle 30 5275
action key_pressed 2 3
reaction hid_report 8 29 0 128 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
end_cycle 30 5280
start_cycle 31 5280
action key_released 2 14
reaction hid_report 8 29 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
end_cycle 31 5285
```

## Compressed documents

The compressed version of Aglais simply replaces all command keyboards by one character integer values. It looks like this:
