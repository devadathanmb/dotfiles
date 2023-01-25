#!/usr/bin/env bash

current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '[\.\d]+(?=%)' | head -1)

function increase_volume(){
  pactl set-sink-volume @DEFAULT_SINK@ "+$value%"
  new_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '[\.\d]+(?=%)' | head -1)
  notify-send -t 400 "🔊 Increasing volume to $new_volume%" 
}

function decrease_volume(){
  pactl set-sink-volume @DEFAULT_SINK@ "-$value%"
  new_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '[\.\d]+(?=%)' | head -1)
  notify-send -t 400 "🔊 Decreasing volume to $new_volume%" 
}

while getopts i:d: flag
do
    case "${flag}" in
        i) value=${OPTARG}; increase_volume "$value";;
        d) value=${OPTARG}; decrease_volume "$value";;
    esac
done
