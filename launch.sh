
#!/bin/bash

# Kill existing Polybar instances
killall -q polybar

# Wait until Polybar has shut down
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# Launch top and bottom bars
polybar --config="$HOME/.config/polybar/config.ini" top &
polybar --config="$HOME/.config/polybar/config.ini" bottom &
