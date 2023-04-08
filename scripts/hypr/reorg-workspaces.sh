#!/bin/bash

# Capture the JSON output of 'hyprctl workspaces -j' using command substitution
json=$(hyprctl workspaces -j)

# Loop through each object in the array using 'jq', extract the 'id' value, and print it
counter=1
for id in $(echo $json | jq -r '.[].id'); do
    if [[ $id -eq $counter ]]
    then
      counter=$(( counter+1 ))
    else
      windows=$(hyprctl clients -j | jq ".[] | select(.workspace.id == "$id") | .address")
      for window in ${windows[@]}
      do
        echo hyprctl dispatch movetoworkspacesilent "$counter",address:$(echo $window | xargs)
        hyprctl dispatch movetoworkspacesilent "$counter",address:$(echo $window | xargs)
      done
      counter=$(( counter+1 ))
    fi
done

