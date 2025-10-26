#!/bin/bash

win_id=$(i3-msg -t get_tree | jq '.. | select(.focused? == true) | .window' | head -n1)

[ -z "$win_id" ] || [ "$win_id" == "null" ] && echo "Desktop" && exit

raw_name=$(xprop -id "$win_id" WM_CLASS 2>/dev/null | awk -F '"' '{print $4}')

capitalize() {
    echo "$1" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}'
}

case "$raw_name" in
    "wezterm"|"org.wezfurlong.wezterm") echo "WezTerm" ;;
    "gnome-terminal") echo "Gnome-Terminal" ;;
    "konsole") echo "Konsole" ;;
    "xfce4-terminal") echo "Xfce4-Terminal" ;;
    "Chromium"|"org.chromium.Chromium") echo "Chromium" ;;
    "google-chrome"|"Chrome") echo "Chrome" ;;
    "firefox"*) echo "Firefox" ;;
    "thunar"|"nautilus"|"dolphin") echo "Files" ;;
    "discord") echo "Discord" ;;
    "spotify") echo "Spotify" ;;
    "libreoffice"*) echo "LibreOffice" ;;
    "") echo "Desktop" ;;
    *) capitalize "$raw_name" ;;  
esac

