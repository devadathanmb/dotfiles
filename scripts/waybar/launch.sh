#!/usr/bin/env bash

launch_bar() {
	# Terminate already running bar instances
	killall -q waybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

	# Launch the bar
  waybar &
}

launch_bar
