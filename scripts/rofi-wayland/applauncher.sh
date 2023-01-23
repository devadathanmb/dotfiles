#!/usr/bin/env bash

# Wrapper script for rofi applauncher

if pgrep -x "rofi"
then
    killall rofi
else
    rofi -show drun -show-icons
fi

