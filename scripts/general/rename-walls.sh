#! /usr/bin/env bash

# A simple script to mass rename all the wallpapers in your wallpaper directory

WALL_DIR="$HOME/Pictures/wallpapers/"

cd $WALL_DIR

for file in *.png *.jpeg *.jpg
do
  filename=$(basename -- "$file")
  extension="${filename##*.}"

  mv "$file" "$counter.$extension"
  counter=$((counter+1))
done