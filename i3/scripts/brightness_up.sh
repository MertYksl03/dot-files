#!/bin/bash

TARGET_DECREASE=10
STEPS=10
STEP_PERCENT=$((TARGET_DECREASE / STEPS))  # Percentage per step

for i in $(seq 1 $STEPS); do
    brightnessctl set "$STEP_PERCENT"%+ > /dev/null
    CURRENT=$(brightnessctl g)
    MAX=$(brightnessctl m)
    PERCENT=$((CURRENT * 100 / MAX))

    notify-send -h int:value:$PERCENT -h string:synchronous:brightness "Brightness" "$PERCENT%"
    sleep 0.05
done
