#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until they are shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar example &
