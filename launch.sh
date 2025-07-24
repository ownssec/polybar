#!/bin/bash

# Set environment variables (important for i3wm)
export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"

# Kill existing Polybar instances
killall -q polybar

# Wait until processes shut down
while pgrep -x polybar >/dev/null; do sleep 0.5; done

# Small delay for X server (adjust as needed)
sleep 0.5

# Launch Polybar on all connected monitors
if type "xrandr" >/dev/null; then
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$monitor polybar --config="$HOME/.config/polybar/config.ini" example &
  done
else
  polybar --config="$HOME/.config/polybar/config.ini" example &
fi

# Wait for Polybar to start (optional)
sleep 1

# Verify Polybar is running
if pgrep -x polybar >/dev/null; then
  echo "Polybar launched successfully"
else
  echo "Polybar failed to start" >&2
  exit 1
fi

#!/bin/bash
# # Ensure environment is ready
# export DISPLAY=:0
# export XDG_CURRENT_DESKTOP=XFCE
#
# # Kill existing Polybar instances
# killall -q polybar
#
# # Wait until all Polybar processes have exited
# while pgrep -x polybar >/dev/null; do sleep 1; done
#
# # Small delay to allow XFCE panel to finish loading
# sleep 2
#
# # Launch Polybar
# polybar --config="$HOME/.config/polybar/config.ini" example &
#

