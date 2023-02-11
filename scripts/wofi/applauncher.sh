#!/usr/bin/env bash

# Wrapper script for wofi applauncher

if pgrep -x "wofi"
then
    killall wofi
else
  wofi
fi

