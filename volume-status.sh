#!/bin/bash
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F/ '{print $2}' | tr -d ' ')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print ($2=="yes"?"0":"1")}')
if [ "$mute" = "0" ]; then
  # Red color for muted
  echo " %{F#ff5555}$mute"
else
  # Default color for unmuted
  echo " $mute"
fi

