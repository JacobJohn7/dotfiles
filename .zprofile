# ~/.zprofile for mello

# Automatically start Hyprland when logging in on TTY1
if [[ -z "$DISPLAY" && "$(tty)" == "/dev/tty1" ]]; then
    exec start-hyprland
fi
