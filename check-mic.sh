#!/bin/bash

# Get the default source (microphone)
MIC_SOURCE=$(pactl info | grep "Default Source" | cut -d' ' -f3)

# Get mute status
IS_MUTED=$(pactl get-source-mute "$MIC_SOURCE" | awk '{print $2}')

if [ "$IS_MUTED" = "yes" ]; then
    echo "mic 0" 
else
    echo "mic 1"
fi

