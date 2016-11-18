#!/bin/bash
# Start CC2650 Bootloader
# This will probably only work on a GNU coreutils machine -- no OSX,
# since I used '-e' echo option.
#
# Craig Hesling <craig@hesling.com>

DEV=${1:-/dev/ttyUSB0}
#DEV=${1:-/dev/ttyACM0}

# Nail the device
while true; do
	echo -e -n "\x55" > $DEV
	echo -e -n "\x55" > $DEV
done
