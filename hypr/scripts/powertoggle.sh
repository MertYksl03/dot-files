#!/usr/bin/env bash

# Get the current state of animations (1 = enabled, 0 = disabled)
STATUS=$(hyprctl getoption decoration:blur:enabled | awk 'NR==1{print $2}')

if [ "$STATUS" = "1" ]; then
    # Disable everything for battery saving
    hyprctl --batch "\
        keyword animations:enabled 0; \
        keyword decoration:rounding 0; \
        keyword decoration:blur:enabled 0; \
        keyword decoration:drop_shadow 0; \
        keyword misc:vfr 1"
    
    notify-send -u low -t 2000 "Hyprland" "Power Saving: ON (Performance Mode)"
else
    # Re-enable everything for "Eye Candy" mode
    hyprctl --batch "\
        keyword animations:enabled 1; \
        keyword decoration:rounding 20; \
        keyword decoration:blur:enabled 1; \
        keyword decoration:drop_shadow 1; \
        keyword misc:vfr 1"

    notify-send -u low -t 2000 "Hyprland" "Power Saving: OFF (Eye Candy Mode)"
fi
