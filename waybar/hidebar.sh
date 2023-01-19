#! /bin/bash
# Hacky script to hide bar

if (( $(pgrep waybar && 1) ));then
  killall waybar
else
  waybar &
fi

