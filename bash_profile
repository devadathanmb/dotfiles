#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# If on tty1, execute hyprland
if [[ $(tty) == "/dev/tty1" ]]
then
  echo "Launching Hyprland"
	exec Hyprland
fi
