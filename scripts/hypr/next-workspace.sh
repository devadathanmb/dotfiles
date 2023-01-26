#! /usr/bin/env bash

# Script to create a new workspaces as per the order

last_workspace=$(hyprctl workspaces -j | jq -c 'sort_by(.id) | .[-1].id')
next_workspace=$(( last_workspace+1 ))

function next_workspace(){
  echo "Next workspace"
  hyprctl dispatch workspace $next_workspace
}

function move_to_next_workspace(){
  echo "Move to next workspace"
  hyprctl dispatch movetoworkspace $next_workspace
}

while getopts nm flag
do
    case "${flag}" in
      n) next_workspace ;;
      m) move_to_next_workspace ;;
    esac
done
