#! /bin/bash
# Hacky script to hide bar

CONFIG_DIR="$HOME/dotfiles/waybar/newbar"

if pgrep -x "waybar"
then
  killall waybar
else
  waybar --config "$CONFIG_DIR/config.jsonc" --style "$CONFIG_DIR/style.css" &
fi

