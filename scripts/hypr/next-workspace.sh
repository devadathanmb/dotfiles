#! /usr/bin/env bash

# Script to move to next workspace as per the order

last_workspace=$(hyprctl workspaces | grep workspace | tail -1 | grep -m 1 -o '[[:digit:]]' | head -n 1)
next_workspace=$(( last_workspace+1 ))

hyprctl dispatch workspace $next_workspace
