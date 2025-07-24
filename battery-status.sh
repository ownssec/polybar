#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$capacity" -lt 30 ]; then
  # Red if battery < 50%
  echo "%{F#ff5555}▮▯▯▯"
elif [ "$capacity" -lt 60 ]; then
  # Red if battery < 50%
  echo "%{F#e0e0e0}▮▮▯▯"
elif [ "$capacity" -lt 90 ]; then
  # Red if battery < 50%
  echo "%{F#e0e0e0}▮▮▮▯"
else
  # Default color (light gray)
  # echo "%{F#e0e0e0}% ▮▮▮▮ $capacity%%{F-} "
  echo "%{F#e0e0e0}▮▮▮▮"
fi
