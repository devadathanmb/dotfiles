#!/bin/bash
# Script to toggle gaps in hyprland


# Get the current gaps values
gaps_in=$(hyprctl getoption general:gaps_in -j | jq ".int")
gaps_out=$(hyprctl getoption general:gaps_out -j | jq ".int")

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

increase_outergaps(){
    hyprctl keyword general:gaps_out $(( gaps_out+1  ))
}

increase_innergaps(){
    hyprctl keyword general:gaps_in $(( gaps_in+1  ))
}

# Decrease gaps

decrease_outergaps(){
    hyprctl keyword general:gaps_out $(( gaps_out-1  ))
}

decrease_innergaps(){
    hyprctl keyword general:gaps_in $(( gaps_in-1  ))
}

while getopts tuijk flag
do
    case "${flag}" in
        t) toggle_gaps ;;
        i) increase_innergaps ;;
        u) decrease_innergaps ;;
        k) increase_outergaps ;;
        j) decrease_outergaps ;;
    esac
done
