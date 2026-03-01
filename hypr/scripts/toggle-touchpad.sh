#!/usr/bin/env bash

STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

# If the file doesn't exist, assume the touchpad is disabled (default boot state)
if [ ! -f "$STATUS_FILE" ]; then
    echo "false" > "$STATUS_FILE"
fi

STATUS=$(cat "$STATUS_FILE")

if [ "$STATUS" = "true" ]; then
    # Disable BOTH the touchpad and the phantom mouse device
    hyprctl keyword "device[elan0718:00-04f3:30fd-touchpad]:enabled" false
    hyprctl keyword "device[elan0718:00-04f3:30fd-mouse]:enabled" false
    
    echo "false" > "$STATUS_FILE"
    notify-send -u low -i input-touchpad "Touchpad" "Disabled"
else
    # Enable BOTH devices
    hyprctl keyword "device[elan0718:00-04f3:30fd-touchpad]:enabled" true
    hyprctl keyword "device[elan0718:00-04f3:30fd-mouse]:enabled" true
    
    echo "true" > "$STATUS_FILE"
    notify-send -u low -i input-touchpad "Touchpad" "Enabled"
fi
