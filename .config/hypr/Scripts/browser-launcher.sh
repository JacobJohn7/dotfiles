#!/usr/bin/env bash

# Launch Zen Browser
if command -v zen-browser >/dev/null 2>&1; then
    exec zen-browser "$@"
else
    # Fallback to standard xdg-open for default browser
    exec xdg-open "https://google.com"
fi
