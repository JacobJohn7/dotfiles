#!/usr/bin/env bash

# Check if running in delete mode
if [ "$1" == "--delete" ]; then
    # Prepend "[CLEAR ALL HISTORY]" option
    selected=$( (echo "🧹 [CLEAR ALL HISTORY]"; cliphist list) | wofi --dmenu --width 700 --height 400 --prompt "Delete Clipboard Item..." --style "$HOME/.config/wofi/style.css" --cache-file /dev/null)
    
    if [ -n "$selected" ]; then
        if [ "$selected" == "🧹 [CLEAR ALL HISTORY]" ]; then
            cliphist wipe
        else
            echo "$selected" | cliphist delete
        fi
    fi
else
    # Copy mode
    selected=$(cliphist list | wofi --dmenu --width 700 --height 400 --prompt "Galaxy Clipboard..." --style "$HOME/.config/wofi/style.css" --cache-file /dev/null)
    
    if [ -n "$selected" ]; then
        echo "$selected" | cliphist decode | wl-copy
    fi
fi
