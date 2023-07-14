#! /usr/bin/env bash

# Kill if any other rofi instance is running
if pgrep -x "rofi"
then
    killall rofi
    exit
fi

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Hibernate\n  Lock" | rofi -p "Power menu" -dmenu -i)

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Suspend") systemctl suspend-then-hibernate ;;
	"  Hibernate") systemctl hibernate ;;
	"  Lock") swaylock ;;
	*) exit 1 ;;
esac
