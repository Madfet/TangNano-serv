# SERV RISC-V core design for Tang Nano

## Overview

Designed to run RISC-V CPU core `SERV` with Tang Nano.

## Function

`sw/blinky.hex` Is a program that runs on SERV. The constant of blinky.hex attached to SERV is modified according to the design.

5th line

```
0042c293
```

Is the instruction corresponding to `xori t0, t0, 4`, and the three digits from the left correspond to the immediate value ` 4`.
So if you replace `0042c293` with ` 0012c293`, you get `xori t0, t0, 1`.

This value corresponds to each color of the RGB LED, so it flashes blue by default and red after the change. `0022c293` is green.

## Build (witout IDE)

Download the GoWin IDE and extract it to a directory somewhere (eg `$ HOME / gowin / 1.9.202`).

Set the extracted directory as `$ GOWIN_HOME` and add ` $ GOWIN_HOME / IDE / bin: $ GOWIN_HOME / Programmer / bin` to the path.

```bash
export PATH=$GOWIN_HOME/IDE/bin:$GOWIN_HOME/Programmer/bin:$PATH
```

Set the license. Reference: [https://qiita.com/ciniml/items/bb9723673c91d8374b63] (https://qiita.com/ciniml/items/bb9723673c91d8374b63)

Clone this repository and build it with make.

(!!! make method is not working yet !!!)

```bash
git clone --recursive https://github.com/ciniml/tn_serv
cd tn_serv
make
```

## Program

If you just want to try it for the time being, do SRAM config. If you turn the power off and then on again, the written contents will be erased.

**f**Running `make run` will run the SRAM config.

```bash
$ make run
if lsmod | grep ftdi_sio; then sudo modprobe -r ftdi_sio; fi
programmer_cli --device GW1N-1 --run 2 --fsFile tn_serv/impl/pnr/tn_serv.fs
 "SRAM Program" starting on device-1...
Programming...: [######################## ] 99%                  User Code: 0x00000000
 Status Code: 0x0001F020
 Cost 4.91 second(s)
```

If you want to write to the config ROM so that it doesn't disappear when the power is turned off, run `make deploy`.

```bash
$ make deploy
if lsmod | grep ftdi_sio; then sudo modprobe -r ftdi_sio; fi
programmer_cli --device GW1N-1 --run 6 --fsFile tn_serv/impl/pnr/tn_serv.fs
 "embFlash Erase,Program,Verify" starting on device-1...
Erasing embFlash ...: [                         ] 0%                 number addresses of data:332
Programming...: [#########################] 100%
Verifying...: [#########################] 100%
 Verify success!
 Status Code: 0x0001F020
 User Code: 0x00000000
 Finished!
 Cost 36.4 second(s)
```

## License

The part I wrote (under the src directory) is the [Boost Software License] (https://www.boost.org/LICENSE_1_0.txt). It is a very loose license as long as the wording of the license remains in the source code.
We do not guarantee the contents of the code and will not compensate for any damage caused by using the code.
The sources of the SERV core under serv / are subject to the SERV license.
