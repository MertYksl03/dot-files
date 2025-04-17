#!/bin/bash

win_id=$(xdotool getactivewindow 2>/dev/null)

if [ -n "$win_id" ]; then
    class=$(xprop -id "$win_id" WM_CLASS 2>/dev/null)
    echo "$class" | awk -F '"' '{print $4}'
else
    echo ""
fi
