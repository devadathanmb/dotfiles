#!/usr/bin/env bash

# Wrapper script for rofi calc
if pgrep -x "rofi"
then
    killall rofi
    exit
fi

rofi -show calc -modi calc -no-show-match -no-sort -calc-command "echo -n '{result}' | wl-copy"
