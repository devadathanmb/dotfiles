#!/bin/bash

killall conky
sleep 5s

conky -c $HOME/.config/conky/Guci/Guci-time.conf &> /dev/null &
conky -c $HOME/.config/conky/Guci/Guci-weather.conf &> /dev/null &
conky -c $HOME/.config/conky/Guci/Guci-uptime.conf &> /dev/null &
conky -c $HOME/.config/conky/Guci/Guci-player.conf &> /dev/null &
