#!/bin/bash

# Ensure environment is ready
export DISPLAY=:0
export XDG_CURRENT_DESKTOP=XFCE

# Kill existing Polybar instances
killall -q polybar

# Wait until all Polybar processes have exited
while pgrep -x polybar >/dev/null; do sleep 1; done

# Small delay to allow XFCE panel to finish loading
sleep 2

# Launch Polybar
polybar --config="$HOME/.config/polybar/config.ini" example &


