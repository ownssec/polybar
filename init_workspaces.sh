#!/bin/bash

# Create empty workspaces by launching and killing xdotool windows
for i in {1..3}; do
  i3-msg "workspace $i"
  xdotool exec --sync sleep 0.1
done

# Return to workspace 1
i3-msg "workspace 1"
