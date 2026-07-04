#!/usr/bin/env bash

STATE_FILE="/tmp/gaming_mode_active"

if [ -f "$STATE_FILE" ]; then
    # Disable Gaming Mode
    rm "$STATE_FILE"
    notify-send -t 2000 -u normal "Gaming Mode" "Disabled. Restoring wallpaper & animations..."
    
    # Re-enable Hyprland visuals using Lua eval
    hyprctl eval 'hl.config({ animations = { enabled = true }, decoration = { shadow = { enabled = true }, blur = { enabled = true } } })'
    
    # Stop them first to prevent "unit already exists" errors, then start them
    systemctl --user stop wallpaper-controller.service >/dev/null 2>&1
    systemctl --user stop mpvpaper.service >/dev/null 2>&1
    sleep 0.5
    
    systemd-run --user --unit=mpvpaper mpvpaper -p -o "--loop --no-audio --hwdec=auto --input-ipc-server=/tmp/mpv-wallpaper-socket" "*" "/home/mello/Pictures/Live Wallpaper/gothic-golden-crown-king-moewalls-com_optimized.mp4" >/dev/null 2>&1
    systemd-run --user --unit=wallpaper-controller /home/mello/.config/hypr/Scripts/wallpaper_controller.py >/dev/null 2>&1
    exit 0
else
    # Enable Gaming Mode
    touch "$STATE_FILE"
    notify-send -t 2000 -u critical "Gaming Mode" "Enabled. Wallpaper & animations disabled."
    
    # Disable Hyprland visuals using Lua eval
    hyprctl eval 'hl.config({ animations = { enabled = false }, decoration = { shadow = { enabled = false }, blur = { enabled = false } } })'
    
    # Stop wallpaper services and ensure mpvpaper is fully killed to free VRAM/RAM
    systemctl --user stop wallpaper-controller.service >/dev/null 2>&1
    systemctl --user stop mpvpaper.service >/dev/null 2>&1
    killall mpvpaper 2>/dev/null
    exit 0
fi
