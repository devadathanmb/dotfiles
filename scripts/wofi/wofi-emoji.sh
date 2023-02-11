#!/usr/bin/env bash

# Wrapper script for rofi emoji

if pgrep -x "wofi-emoji"
then
    killall wofi-emoji
    exit
fi

wofi-emoji
