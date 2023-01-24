#!/usr/bin/env bash

# Wrapper script for wlogout

# This prevents wlogout from creating multiple instances 
# which causes kind of giltch
killall wlogout 
wlogout
