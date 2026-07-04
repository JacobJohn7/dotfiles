#!/bin/bash

# Options
shutdown="󰐥  Shutdown"
reboot="󰜉  Reboot"
suspend="󰤄  Suspend"
lock="󰍜  Lock Screen"
logout="󰍃  Logout"

options="$shutdown\n$reboot\n$suspend\n$lock\n$logout"

selected="$(echo -e "$options" | wofi --dmenu --config /home/mello/.config/wofi/config --style /home/mello/.config/wofi/style.css --prompt "Power Menu" --width 250 --height 280 --cache-file /dev/null)"

case $selected in
    *"Shutdown"*)
        systemctl poweroff
        ;;
    *"Reboot"*)
        systemctl reboot
        ;;
    *"Suspend"*)
        systemctl suspend
        ;;
    *"Lock Screen"*)
        loginctl lock-session
        ;;
    *"Logout"*)
        hyprctl dispatch exit
        ;;
esac
