#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT0"

# Exit silently if no battery
if [ ! -f "$BAT_PATH/capacity" ]; then
  exit 0
fi

capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$capacity" -lt 30 ]; then
  echo "%{F#ff5555}▂"
elif [ "$capacity" -lt 60 ]; then
  echo "%{F#e0e0e0}▄"
elif [ "$capacity" -lt 90 ]; then
  echo "%{F#e0e0e0}▅"
else
  # Default color (light gray)
  # echo "%{F#e0e0e0}% ▮▮▮▮ $capacity%%{F-} "
  echo "%{F#e0e0e0}	▇"
fi
