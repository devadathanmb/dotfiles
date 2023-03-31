#! /usr/bin/env bash

# Script to create a new workspaces as per the order

last_workspace=$(hyprctl workspaces -j | jq -c 'sort_by(.id) | .[-1].id')
next_workspace=$(( last_workspace+1 ))

function next_workspace(){
  hyprctl dispatch workspace $next_workspace
}

function last(){
  hyprctl dispatch workspace $last_workspace
}

function first(){
  first_workspace=$(hyprctl workspaces -j | jq -c 'sort_by(.id) | .[0].id')
  hyprctl dispatch workspace $first_workspace
}

function move_to_next_workspace(){
  hyprctl dispatch movetoworkspace $next_workspace
}

while getopts nmlf flag
do
    case "${flag}" in
      n) next_workspace ;;
      m) move_to_next_workspace ;;
      l) last ;;
      f) first ;;
    esac
done
