#! /usr/bin/env bash

picked_color=$(hyprpicker -n)
echo $picked_color | wl-copy
notify-send "🌈 Color picked $picked_color"
