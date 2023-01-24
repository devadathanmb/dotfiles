#! /bin/bash
# Hacky script to hide bar

if pgrep -x "waybar"
then
  killall waybar
else
  waybar &
fi

