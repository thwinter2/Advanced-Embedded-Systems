#!/bin/bash
#  Toggle a GPIO pin

# please clean up on exit
trap "echo 18 > /sys/class/gpio/unexport" EXIT

# configure
echo 18 > /sys/class/gpio/export
sleep 0.1
echo "out" > /sys/class/gpio/gpio18/direction

COUNTER=0
while [ $COUNTER -lt 100000 ]; do
    echo 1 > /sys/class/gpio/gpio18/value
    echo 0 > /sys/class/gpio/gpio18/value
    let COUNTER=COUNTER+1
done
echo 18 > /sys/class/gpio/unexport
