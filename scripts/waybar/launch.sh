#!/usr/bin/env bash

CONFIG_DIR="$HOME/dotfiles/waybar/newbar"
launch_bar() {
	# Terminate already running bar instances
	killall -q waybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

	# Launch the bar
  waybar --config "$CONFIG_DIR/config.jsonc" --style "$CONFIG_DIR/style.css" &
}

launch_bar
