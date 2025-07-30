#!/bin/bash

# Set environment variables (important for i3wm)
export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"

# Kill existing Polybar instances
killall -q polybar

# Wait until Polybar shuts down
while pgrep -x polybar >/dev/null; do sleep 0.5; done

# Optional: small delay
sleep 0.5

# Choose primary monitor (e.g., eDP-1 or fallback to first connected)
PRIMARY_MONITOR=$(xrandr --query | grep " connected primary" | cut -d" " -f1)

if [ -z "$PRIMARY_MONITOR" ]; then
  PRIMARY_MONITOR=$(xrandr --query | grep " connected" | head -n1 | cut -d" " -f1)
fi

# Launch Polybar on the selected monitor
MONITOR=$PRIMARY_MONITOR polybar --config="$HOME/.config/polybar/config.ini" example &

# Wait for Polybar to start (optional)
sleep 1

# Check if it's running
if pgrep -x polybar >/dev/null; then
  echo "Polybar launched on $PRIMARY_MONITOR"
else
  echo "Polybar failed to start" >&2
  exit 1
fi
