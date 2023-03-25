#! /usr/bin/env bash

# Script to toggle animations and blur in hyprland

# Toggle using bind
function toggle_mode(){
    status=$(hyprctl getoption animations:enabled -j | jq ".int")
    if [[ $status -eq 1 ]]
    then
        notify-send "😿 Animations disabled"
        hyprctl keyword animations:enabled 0
    else
        notify-send "😎 Animations enabled"
        hyprctl keyword animations:enabled 1
    fi
}

while getopts t flag
do
    case "${flag}" in
      t) toggle_mode ;;
    esac
done
