#! /usr/bin/env bash

# Get current active window's address
current_window=$(hyprctl activewindow -j | jq -r ".address")

# Activate border
function activate_border(){
  hyprctl keyword general:border_size 1
}

# Deactivate border
function deactivate_border(){
  hyprctl keyword general:border_size 0
}

function main(){
  status=$(hyprctl getoption general:border_size -j | jq ".int")
  if [[ $status -eq 0 ]]
  then
    activate_border
  else
    deactivate_border
  fi
}

main

# while getopts ad flag
# do
#     case "${flag}" in
#       a) activate_border ;;
#       d) deactivate_border ;;
#     esac
# done
