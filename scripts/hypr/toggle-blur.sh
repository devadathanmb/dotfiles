#! /usr/bin/env bash

OPACITY="0.86"

turn_on_blur(){
  # Change background opacity of kitty
  sed -i "s/^background_opacity [0-9]\+\(\.[0-9]\+\)\{0,1\}$/background_opacity $OPACITY/" "$HOME/.config/kitty/kitty.conf"
  
  # Change background opacity of alacritty
  sed -i "s/ opacity: [0-9]\+\(\.[0-9]\+\)\{0,1\}$/ opacity: $OPACITY/" "$HOME/.config/alacritty/alacritty.yml"

  # Change background of foot term
  sed -i "s/alpha=[0-9]\+\(\.[0-9]\+\)\{0,1\}/alpha=$OPACITY/g" "$HOME/.config/foot/foot.ini"

  # Hyprland blur
  hyprctl keyword decoration:blur:enabled 1;

  # Reload kitty
  pkill -USR1 kitty

  # Reload foot
  pkill -HUP foot
} 

turn_off_blur(){
  # Change background opacity of kitty
  sed -i "s/^background_opacity [0-9]\+\(\.[0-9]\+\)\{0,1\}$/background_opacity 1.00/" "$HOME/.config/kitty/kitty.conf"
  
  # Change background opacity of alacritty
  sed -i "s/ opacity: [0-9]\+\(\.[0-9]\+\)\{0,1\}$/ opacity: 1.00/" "$HOME/.config/alacritty/alacritty.yml"

  # Change background of foot term
  sed -i "s/alpha=[0-9]\+\(\.[0-9]\+\)\{0,1\}/alpha=1.00/g" "$HOME/.config/foot/foot.ini"

  # Hyprland blur
  hyprctl keyword decoration:blur:enabled 0;

  # Reload foot
  pkill -HUP foot

  # Reload kitty
  pkill -USR1 kitty
}

main() {
  status=$(hyprctl getoption decoration:blur:enabled -j | jq ".int")
  if [[ $status -eq 0 ]]
  then
    notify-send "👓 Turning blur on"
    turn_on_blur
  else
    notify-send "🕶️ Turning blur off"
    turn_off_blur
  fi
}

main
