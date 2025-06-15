##!/bin/bash

# Get default sink
SINK=$(pactl get-default-sink)

# Get current volume (first channel)
CURRENT_VOL=$(pactl get-sink-volume "$SINK" | grep -oP '\d+(?=%)' | head -1)

# Set decrement step (%)
DECREMENT=5

# Calculate new volume
NEW_VOL=$((CURRENT_VOL - DECREMENT))

# If the new volume is 0 then mute is on
if [ "$NEW_VOL" -lt 0 ] || [ "$NEW_VOL" = 0 ]; then
    pactl set-sink-mute "$SINK" 1
    pactl set-sink-volume "$SINK" "0%"
    notify-send -h string:synchronous:volume "Volume" "muted"
    exit
fi

# Set the new volume
pactl set-sink-volume "$SINK" "${NEW_VOL}%"

# Send a notifaction
notify-send -h int:value:$NEW_VOL -h string:synchronous:volume "Volume" "$NEW_VOL%"
