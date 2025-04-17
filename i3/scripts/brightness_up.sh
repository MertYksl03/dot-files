#!/bin/bash

STEPS=10
STEP_SIZE=1

for i in $(seq 1 $STEPS); do
    brightnessctl set "$STEP_SIZE"%+ > /dev/null
    CURRENT=$(brightnessctl g)
    MAX=$(brightnessctl m)
    PERCENT=$((CURRENT * 100 / MAX))
    notify-send -h int:value:$PERCENT -h string:synchronous:brightness "Brightness" "$PERCENT%"
    sleep 0.05
done
