#!/bin/bash
# Script to toggle gaps in hyprland


# Get the current gaps values
gaps_in=$(hyprctl getoption general:gaps_in | grep int | cut -d ":" -f 2 | xargs) 
gaps_out=$(hyprctl getoption general:gaps_out | grep int | cut -d ":" -f 2 | xargs) 

# Toggle gaps

toggle_gaps(){
  if [[ $gaps_in == "0" ]]
  then
    hyprctl keyword general:gaps_in 3
    hyprctl keyword general:gaps_out 3
  else
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
  fi
}

# Increase gaps

increase_gaps(){
    hyprctl keyword general:gaps_in $(( gaps_in+1  ))
    hyprctl keyword general:gaps_out $(( gaps_out+1  ))
}

# Decrease gaps 

decrease_gaps(){
    hyprctl keyword general:gaps_in $(( gaps_in-1  ))
    hyprctl keyword general:gaps_out $(( gaps_out-1  ))
}

while getopts tid flag
do
    case "${flag}" in
        t) toggle_gaps ;;
        i) increase_gaps ;;
        d) decrease_gaps ;;
    esac
done
