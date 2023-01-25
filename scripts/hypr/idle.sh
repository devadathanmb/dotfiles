#!/usr/bin/env bash

swayidle -w \
         timeout 300 'echo "Activating idle lock!" ; /home/devadathan/dotfiles/scripts/hypr/lock.sh &' \
         timeout 600 'echo "Turning dpms off" ; hyprctl dispatch dpms off' \
                   resume 'echo "Turning dpms on" ; hyprctl dispatch dpms on' \
         before-sleep 'echo "Activating sleep lock!" ; /home/devadathan/dotfiles/scripts/hypr/lock.sh &'
