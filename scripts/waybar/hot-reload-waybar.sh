#!/bin/bash

CONFIG_FILES="$HOME/dotfiles/waybar/bar3/config.jsonc $HOME/dotfiles/waybar/bar3/style.css"

trap "killall waybar" EXIT

while true; do
    waybar --config $(echo $CONFIG_FILES | cut -d " " -f 1)  --style $(echo $CONFIG_FILES | cut -d " " -f 2) &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
