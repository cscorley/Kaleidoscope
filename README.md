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
