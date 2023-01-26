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

# Function to remove existing symlink if any
function remove_symlink(){
  current_wall=$(find "$CACHE_DIR/" -maxdepth 1 -name "current-wall" -print -quit)
  if [[ ! -z "$current_wall" ]]
  then
    rm $current_wall
  fi
}

# Function to pick a random wallpaper from the wallpaper directory
function pick_random(){
  random_wall=$( find "$WALL_DIR/" -type f -print0 | shuf -z -n 1 )
  while [[ $current_wall = $random_wall ]]
  do
    random_wall=$( find "$WALL_DIR/" -type f -print0 | shuf -z -n 1 )
  done
}

# Function to set new symlink
function set_new_link(){
  ln -s "$random_wall" "$CACHE_DIR/current-wall"
}

# Function to set the wallpaper
function set_wallpaper(){
  if pgrep -x "swaybg"
  then
    killall swaybg
  fi
  notify-send -t 350 "🐧 Changing wallpaper"
  swaybg -i "$CACHE_DIR/current-wall" --mode fit &
}

# Function to cycle through wallpapers
function cycle_wallpaper(){
  original_wall=$(readlink "$current_wall")
  next_wall=$()
}

function main(){
  remove_symlink
  pick_random
  set_new_link
  set_wallpaper
}
main
