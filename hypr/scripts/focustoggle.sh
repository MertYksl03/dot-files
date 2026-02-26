#!/usr/bin/env bash

# Get the current state of animations (1 = enabled, 0 = disabled)
STATUS=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$STATUS" = "1" ]; then
    # Disable animations for focus mode
    hyprctl --batch "\
        keyword animations:enabled 0; \
        keyword misc:vfr 1"
    
    notify-send -u low -t 2000 "Hyprland" "Focus mode: ON"
else
    # Re-enable animations for Causal mode
    hyprctl --batch "\
        keyword animations:enabled 1; \
        keyword misc:vfr 1"

    notify-send -u low -t 2000 "Hyprland" "Focus mode: OFF "
fi
