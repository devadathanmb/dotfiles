#!/usr/bin/env bash

# Wrapper script for rofi emoji

if pgrep -x "rofi"
then
    killall rofi
    exit
fi

rofi -modi emoji -show emoji
