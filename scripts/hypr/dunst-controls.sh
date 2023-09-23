#! /usr/bin/env bash

# A script to control dunst notifications
function dnd_toggle() {
    if [[ $(dunstctl is-paused) == "true" ]]; then
        dunstctl close-all && dunstctl set-paused false && notify-send "🚨 Notifications enabled"
    else
        notify-send "⏰ Notifications disabled" && sleep 0.5 && dunstctl set-paused true
    fi
}

if [[ $1 == "dnd-toggle" ]]; then
    dnd_toggle
fi
