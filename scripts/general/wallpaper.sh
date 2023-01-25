#! /usr/bin/env bash

# A simple bash script to change wallpaper using swaybg

# We should be able to cycle through wallpaper through a keybinding
# So for that we can make use of symlinks
# Set a symlink to the cache dir for the current wallpaper
# When key pressed, remove the symlink, choose a file from the wallpaper dir
# Set the new file to the symlink
# Use swaybg to use that symlink

WALL_DIR="$HOME/Pictures/wallpapers"
CACHE_DIR="$HOME/.cache"

function set_symlink(){

  current_wall=$(find "$CACHE_DIR/" -maxdepth 1 -name "current-wall.*")
  echo $current_wall
  if [[ ! -z "$current_wall" ]]
  then
    echo "Yess sir"
  else
    echo "No sirr"
  fi

}

set_symlink
