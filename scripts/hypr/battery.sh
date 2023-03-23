#! /usr/bin/env bash

# Script to toggle battery mode in hyprland

# Toggle using bind
function toggle_battery_mode(){
    status=$(hyprctl getoption animations:enabled -j | jq ".int")
    if [[ $status -eq 1 ]]
    then
        notify-send "🔋 Battery mode on"
        hyprctl --batch "\
      keyword animations:enabled 0;\
      keyword decoration:blur 0;\
      "
        exit
    else
        notify-send "🔌 Battery mode off"
        hyprctl --batch "\
      keyword animations:enabled 1;\
      keyword decoration:blur 1;\
      "
        exit
    fi
    hyprctl reload
}

while getopts t flag
do
    case "${flag}" in
      t) toggle_battery_mode ;;
    esac
done
