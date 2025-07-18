#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$capacity" -lt 35 ]; then
  # Red if battery < 50%
  echo "%{F#ff5555}🔋 $capacity%%{F-} "
else
  # Default color (light gray)
  echo "%{F#e0e0e0}🔋 $capacity%%{F-} "
fi
