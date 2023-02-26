# SERV RISC-V core design for Tang Nano

## Overview

Designed to run RISC-V CPU core `SERV` with Tang Nano.

## Firmware Description

`sw/blinky.hex` Is a program that runs on SERV.
The constant of blinky.hex attached to SERV is modified according to the design.
build hex file:
```bash
cd tangnano-risc/sw
make clean
make blinky.hex
```

## Build (witout IDE)

Download the GoWin IDE and extract it to a directory somewhere (eg `$ HOME / gowin / 1.9.202`).

Set the extracted directory as `$ GOWIN_HOME` and add ` $ GOWIN_HOME / IDE / bin: $ GOWIN_HOME / Programmer / bin` to the path.

```bash
export PATH=$GOWIN_HOME/IDE/bin:$GOWIN_HOME/Programmer/bin:$PATH
```

Set the license. Reference: [https://qiita.com/ciniml/items/bb9723673c91d8374b63] (https://qiita.com/ciniml/items/bb9723673c91d8374b63)

## Program

```bash
cd tangnano-risc/impl/pnr
openFPGALoader -b tangnano tangnano-risc.fs
```
## License

The part I wrote (under the src directory) is the [Boost Software License] (https://www.boost.org/LICENSE_1_0.txt). It is a very loose license as long as the wording of the license remains in the source code.
We do not guarantee the contents of the code and will not compensate for any damage caused by using the code.
The sources of the SERV core under serv / are subject to the SERV license.
