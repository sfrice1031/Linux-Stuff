#!/bin/bash

# Script to turn the brightness of the screen up.
# Make sure to chmod 646 the brightness_file on the computers local filesystem 

brightness_file=/sys/class/backlight/amdgpu_bl0/brightness
brightness=$(< $brightness_file)

if [ $((brightness < 255)) '=' 1 ]
then
    brightness=$((brightness + 5))
    echo -n $brightness > $brightness_file
fi
