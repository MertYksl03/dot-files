#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/run/user/1000/lyxauth

# Get touchpad device ID
touchpad_id=$(xinput list | grep -i touchpad | grep -o 'id=[0-9]*' | head -n1 | cut -d= -f2)

# Get current state: enabled = 1, disabled = 0
enabled=$(xinput list-props "$touchpad_id" | grep "Device Enabled" | awk '{print $NF}')

# Toggle state
if [ "$enabled" -eq 1 ]; then
    xinput disable "$touchpad_id"
else
    xinput enable "$touchpad_id"
fi
