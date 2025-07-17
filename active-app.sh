#!/bin/bash

# Get active window ID
win_id=$(xdotool getactivewindow 2>/dev/null)

# Exit if no window is focused
[ -z "$win_id" ] && echo "Desktop" && exit

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

# Simplify names (add more as needed)
case "$raw_name" in
    "org.wezfurlong.wezterm") echo "Terminal" ;;
    "Org.chromium.Chromium") echo "Chromium" ;;
    "google-chrome") echo "Chrome" ;;
    "firefox"*) echo "Firefox" ;;
    "thunar"|"nautilus"|"dolphin") echo "Files" ;;
    "code"|"vscode") echo "VSCode" ;;
    "jetbrains-idea") echo "IntelliJ" ;;
    "discord") echo "Discord" ;;
    "spotify") echo "Spotify" ;;
    "libreoffice"*) echo "LibreOffice" ;;
    "gnome-terminal"|"konsole"|"xfce4-terminal") echo "Terminal" ;;
    "") echo "Desktop" ;;
    *) echo "$raw_name" ;;
esac
