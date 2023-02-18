#! /usr/bin/env bash

# Get current active window's address
current_window=$(hyprctl activewindow -j | jq -r ".address")

# Activate border
function activate_border(){
  echo "Activate border"
  hyprctl setprop address:$current_window forcenoborder 0 lock
}

# Deactivate border
function deactivate_border(){
  echo "Deactivate border"
  hyprctl setprop address:$current_window forcenoborder 1 lock
}

while getopts ad flag
do
    case "${flag}" in
      a) activate_border ;;
      d) deactivate_border ;;
    esac
done
