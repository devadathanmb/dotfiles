#! /usr/bin/env bash

# Check if music is running
if pidof "rofi-music" > /dev/null
then
    kill $(pidof "rofi-music") && notify-send "🛑 Music stopped"
else
    exec -a "rofi-music" mpv --no-video $1 && notify-send "🎶 Playing music"
fi
