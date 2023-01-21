#!/usr/bin/env bash

image="$HOME/Pictures/wallpapers/4.jpg"
lock="swaylock --clock --image $image --effect-blur 10x5"

swayidle -w \
         timeout 300 'echo "Activating idle lock!" ; /home/devadathan/lock.sh &' \
         timeout 600 'echo "Turning dpms off" ; hyprctl dispatch dpms off' \
                   resume 'echo "Turning dpms on" ; hyprctl dispatch dpms on' \
         before-sleep 'echo "Activating sleep lock!" ; /home/devadathan/lock.sh &'
