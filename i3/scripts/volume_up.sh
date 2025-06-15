#!/bin/bash

MAX_VOL=150

# Get default sink
SINK=$(pactl get-default-sink)

# Unmute if muted
MUTE_STATE=$(pactl get-sink-mute "$SINK" | awk '{print $2}')
if [ "$MUTE_STATE" = "yes" ]; then
    pactl set-sink-mute "$SINK" 0
fi

# Get current volume (first channel)
CURRENT_VOL=$(pactl get-sink-volume "$SINK" | grep -oP '\d+(?=%)' | head -1)

# Set increment step (%)
INCREMENT=5

# Calculate new volume
NEW_VOL=$((CURRENT_VOL + INCREMENT))
if [ "$NEW_VOL" -gt $MAX_VOL ]; then
    NEW_VOL=$MAX_VOL
fi

# Set the new volume
pactl set-sink-volume "$SINK" "${NEW_VOL}%"

# Send a notifaction
notify-send -h int:value:$NEW_VOL -h string:synchronous:volume "Volume" "$NEW_VOL%"
