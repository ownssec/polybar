
#!/bin/bash

<<<<<<< HEAD
export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"

# Kill all polybar instances
=======
# Set environment variables (optional but good for i3)
export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"

# Kill any existing Polybar instances
>>>>>>> 316461796659573ac8cc04d169ba0b2bc476129d
killall -q polybar

# Wait until it's fully dead
while pgrep -x polybar >/dev/null; do sleep 0.5; done

sleep 0.5  # Allow X to settle

<<<<<<< HEAD
# Pick primary monitor (or fallback)
PRIMARY_MONITOR=$(xrandr --query | grep " connected primary" | cut -d" " -f1)
=======
# Get primary monitor
PRIMARY_MONITOR=$(xrandr --query | awk '/ primary/{print $1}')

# Fall back to the first connected if no primary is set
>>>>>>> 316461796659573ac8cc04d169ba0b2bc476129d
if [ -z "$PRIMARY_MONITOR" ]; then
  PRIMARY_MONITOR=$(xrandr --query | grep " connected" | head -n1 | cut -d" " -f1)
fi

<<<<<<< HEAD
export MONITOR=$PRIMARY_MONITOR

# Launch both panels
polybar bottomPanel --config="$HOME/.config/polybar/config.ini" &


# #!/bin/bash
#
# # Set environment variables (important for i3wm)
=======
# Launch Polybar on only the primary monitor
MONITOR=$PRIMARY_MONITOR polybar --config="$HOME/.config/polybar/config.ini" example &

# Optional: confirm launch
sleep 1
if pgrep -x polybar >/dev/null; then
  echo "Polybar launched on $PRIMARY_MONITOR"
else
  echo "Polybar failed to start" >&2
  exit 1
fi



# #!/bin/bash
#
# # Set environment variables (important for i3wm)
# export DISPLAY=:0
# export XAUTHORITY="$HOME/.Xauthority"
#
# # Kill existing Polybar instances
# killall -q polybar
#
# # Wait until processes shut down
# while pgrep -x polybar >/dev/null; do sleep 0.5; done
#
# # Small delay for X server (adjust as needed)
# sleep 0.5
#
# # Launch Polybar on all connected monitors
# if type "xrandr" >/dev/null; then
#   for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$monitor polybar --config="$HOME/.config/polybar/config.ini" example &
#   done
# else
#   polybar --config="$HOME/.config/polybar/config.ini" example &
# fi
#
# # Wait for Polybar to start (optional)
# sleep 1
#
# # Verify Polybar is running
# if pgrep -x polybar >/dev/null; then
#   echo "Polybar launched successfully"
# else
#   echo "Polybar failed to start" >&2
#   exit 1
# fi

#!/bin/bash
# # Ensure environment is ready
>>>>>>> 316461796659573ac8cc04d169ba0b2bc476129d
# export DISPLAY=:0
# export XAUTHORITY="$HOME/.Xauthority"
#
# # Kill existing Polybar instances
# killall -q polybar
#
# # Wait until Polybar shuts down
# while pgrep -x polybar >/dev/null; do sleep 0.5; done
#
# # Optional: small delay
# sleep 0.5
#
# # Choose primary monitor (e.g., eDP-1 or fallback to first connected)
# PRIMARY_MONITOR=$(xrandr --query | grep " connected primary" | cut -d" " -f1)
#
# if [ -z "$PRIMARY_MONITOR" ]; then
#   PRIMARY_MONITOR=$(xrandr --query | grep " connected" | head -n1 | cut -d" " -f1)
# fi
#
# # Launch Polybar on the selected monitor
# MONITOR=$PRIMARY_MONITOR polybar --config="$HOME/.config/polybar/config.ini" bottomPanel &
#
# # Launch both top and bottom bars on the same monitor
# MONITOR=$PRIMARY_MONITOR polybar --config="$HOME/.config/polybar/config.ini" topPanel &
#
# # Wait for Polybar to start (optional)
# sleep 1
#
# # Check if it's running
# if pgrep -x polybar >/dev/null; then
#   echo "Polybar launched on $PRIMARY_MONITOR"
# else
#   echo "Polybar failed to start" >&2
#   exit 1
# fi
