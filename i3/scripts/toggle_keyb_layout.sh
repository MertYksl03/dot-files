#!/bin/bash

# Get current layout
current=$(setxkbmap -query | awk '/layout/{print $2}')

if [ "$current" = "us" ]; then
    setxkbmap tr
    notify-send "Keyboard Layout" "TR"
else
    setxkbmap us
    notify-send "Keyboard Layout" "US"
fi

