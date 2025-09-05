#!/bin/bash

export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"

# Kill all polybar instances
killall -q polybar

# Wait until it's fully dead
while pgrep -x polybar >/dev/null; do sleep 0.5; done

sleep 0.5  # Allow X to settle

# Pick primary monitor (or fallback)
PRIMARY_MONITOR=$(xrandr --query | grep " connected primary" | cut -d" " -f1)
if [ -z "$PRIMARY_MONITOR" ]; then
  PRIMARY_MONITOR=$(xrandr --query | grep " connected" | head -n1 | cut -d" " -f1)
fi

export MONITOR=$PRIMARY_MONITOR

# Launch both panels
polybar bottomPanel --config="$HOME/.config/polybar/config.ini" &
