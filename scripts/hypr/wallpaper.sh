#! /usr/bin/env bash

# A simple bash script to change wallpaper using swaybg

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
  ln -s "$1" "$CACHE_DIR/current-wall"
}

# Function to set the wallpaper
function set_wallpaper(){
  if pgrep -x "swaybg"
  then
    killall swaybg
  fi
  # notify-send -t 350 "🐧 Changing wallpaper"
  dunstify -I "$CACHE_DIR/current-wall" -t 350 "🐧 Changing wallpaper"
  swaybg -i "$CACHE_DIR/current-wall" --mode fill &
}

# Function to cycle through wallpapers
function cycle_wallpaper(){
  original_wall=$(find "$CACHE_DIR/" -maxdepth 1 -name "current-wall" -exec readlink {} \;)
  next_wall=$(ls -1 -d $WALL_DIR/* | grep "$original_wall" -A 1 | tail -1)
   
   if [[ $next_wall  == $original_wall ]]
   then
     next_wall=$(ls -d $WALL_DIR/* | head -1)
   fi
   remove_symlink
   set_new_link $next_wall
   set_wallpaper
}

# Function to reverse cycle through wallpapers
function cycle_rev_wallpaper(){
  original_wall=$(find "$CACHE_DIR/" -maxdepth 1 -name "current-wall" -exec readlink {} \;)
  next_wall=$(ls -1 -d $WALL_DIR/* | grep "$original_wall" -B 1 | head -1)
   
   if [[ $next_wall  == $original_wall ]]
   then
     next_wall=$(ls -d $WALL_DIR/* | tail -1)
   fi
   remove_symlink
   set_new_link $next_wall
   set_wallpaper
}

# Function to set a random wallpaper
function random_wallpaper(){
  remove_symlink
  pick_random
  set_new_link $random_wall
  set_wallpaper
}

# Wrapper swaybg : Wrapper script to be used to set up wallpapers
function wrapper_swaybg(){
  remove_symlink
  set_new_link $1
  set_wallpaper
} 

while getopts rcbw: flag
do
    case "${flag}" in
        r) random_wallpaper ;;
        c) cycle_wallpaper ;;
        b) cycle_rev_wallpaper ;;
        w) wrapper_swaybg "$OPTARG" ;;
    esac
done
