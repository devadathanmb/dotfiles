#! /usr/bin/env bash

# Wrapper script for launching nmtui

if pidof "nmtui" > /dev/null
then
  pkill "nmtui"
else
  # kitty --title 'nmtui' -e nmtui
  foot -T "nmtui" sh -c nmtui 
fi
