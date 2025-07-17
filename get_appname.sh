#!/bin/bash
win_id=$(xdotool getactivewindow)
app_name=$(xprop -id $win_id WM_CLASS | awk -F'"' '{print $4}')

# Format names nicely
case "$app_name" in
    "firefox") echo "󰈹 Firefox" ;;
    "alacritty") echo " Terminal" ;;
    "thunar") echo " Files" ;;
    "code") echo "󰨞 VSCode" ;;
    *) echo "${app_name^}" ;;  # Capitalize first letter
esac
