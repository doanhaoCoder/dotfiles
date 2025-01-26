#!/bin/bash

# Power menu script using Rofi with icons
CHOSEN=$(printf "🔒 Lock\n⏾ Suspend\n󰑙 Reboot\n⏻ Shutdown\n󰗽 Log Out" | rofi -dmenu -i -p "Power Menu")

case "$CHOSEN" in
    "🔒 Lock")
        swaylock --hide-keyboard-layout 
        ;;
    "⏾ Suspend")
        systemctl suspend-then-hibernate
        ;;
    "󰑙 Reboot")
        reboot
        ;;
    "⏻ Shutdown")
        poweroff
        ;;
    "󰗽 Log Out")
        hyprctl dispatch exit 1
        ;;
    *)
        exit 1
        ;;
esac
