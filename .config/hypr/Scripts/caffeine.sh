#!/usr/bin/env bash

# Check if hypridle is running
if pgrep -x "hypridle" >/dev/null; then
    # Disable hypridle (enable caffeine mode)
    killall hypridle
    notify-send -t 2000 -u critical "Caffeine Mode" "Enabled. Screen sleep and lock are suspended."
else
    # Enable hypridle (disable caffeine mode)
    hypridle >/dev/null 2>&1 &
    notify-send -t 2000 -u normal "Caffeine Mode" "Disabled. Screen sleep and lock are active."
fi
