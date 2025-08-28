#!/bin/bash

BAT_DIR="/sys/class/power_supply/BAT0"

# Exit silently if battery not found
if [ ! -f "$BAT_DIR/capacity" ]; then
  echo "++++"
  exit 0
fi

capacity=$(cat "$BAT_DIR/capacity")
status=$(cat "$BAT_DIR/status")

# Choose icon and default color
if [ "$capacity" -lt 30 ]; then
  icon="+---"
  color="%{F#ff5555}"  # red
elif [ "$capacity" -lt 60 ]; then
  icon="++--"
  color="%{F#e0e0e0}"  # light gray
elif [ "$capacity" -lt 90 ]; then
  icon="+++-"
  color="%{F#e0e0e0}"  # light gray
else
  icon="++++"
  color="%{F#e0e0e0}"  # light gray
fi

# If charging, override color to green
if [ "$status" = "Charging" ]; then
  color="%{F#50fa7b}"  # green
fi

# Output to Polybar
echo "${color}${icon}"
