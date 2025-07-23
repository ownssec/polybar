#!/bin/bash

# Get active window ID
win_id=$(xdotool getactivewindow 2>/dev/null)

# Exit if no window is focused
[ -z "$win_id" ] && echo "desktop" && exit

# Try multiple methods to get the application name
get_app_name() {
    # Method 1: xprop (most reliable)
    local name=$(xprop -id "$win_id" WM_CLASS 2>/dev/null | awk -F '"' '{print $4}')
    [ -n "$name" ] && echo "$name" && return
    
    # Method 2: wmctrl (fallback)
    name=$(wmctrl -lx | grep "$win_id" | awk '{print $3}' | cut -d '.' -f1)
    [ -n "$name" ] && echo "$name" && return
    
    # Method 3: xdotool (last resort)
    xdotool getwindowfocus getwindowname | awk '{print $1}'
}

# Get raw application name
raw_name=$(get_app_name)

# Normalize and simplify names (add more as needed)
case "$raw_name" in
    "org.wezfurlong.wezterm") echo "terminal" ;;
    "Org.chromium.Chromium") echo "chromium" ;;
    "google-chrome") echo "chrome" ;;
    "firefox"*) echo "firefox" ;;
    "thunar"|"nautilus"|"dolphin") echo "files" ;;
    "discord") echo "discord" ;;
    "spotify") echo "spotify" ;;
    "libreoffice"*) echo "libreoffice" ;;
    "gnome-terminal"|"konsole"|"xfce4-terminal") echo "terminal" ;;
    "") echo "desktop" ;;
    *) echo "${raw_name,,}" ;;  # Convert to lowercase
esac

