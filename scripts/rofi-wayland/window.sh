#!/usr/bin/env bash

# Wrapper script for rofi window selector

if pgrep -x "rofi"
then
    killall rofi
else
    rofi -show window -show-icons
fi

