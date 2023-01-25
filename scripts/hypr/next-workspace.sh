#! /usr/bin/env bash

# Script to create a new workspaces as per the order

last_workspace=$(hyprctl workspaces -j | jq -c 'sort_by(.id) | .[-1].id')
next_workspace=$(( last_workspace+1 ))

hyprctl dispatch workspace $next_workspace
