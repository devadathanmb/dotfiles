#!/usr/bin/env bash

# This prevents wlogout from creating multiple instances 
# which causes kind of giltch
killall wlogout 
wlogout
