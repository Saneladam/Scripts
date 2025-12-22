#!/bin/bash

# =============================================================================
# Authors:      Roman Garcia Guill
# Contact:      romangarciaguill@gmail.com
# Created:      Sun 14. Dec 2025
#
# Purpose:      Check and send notification on battery status. 
# =============================================================================

BATTERY="/org/freedesktop/UPower/devices/battery_BAT0"

LEVEL=$(upower -i "$BATTERY" | awk '/percentage:/ {gsub("%",""); print $2}')
STATE=$(upower -i "$BATTERY" | awk '/state:/ {print $2}')

LOW=20
CRITICAL=10

if [ "$STATE" = "discharging" ]; then
    if [ "$LEVEL" -le "$CRITICAL" ]; then
        notify-send -u critical -t 0 "BATTERY CRITICAL" "Battery at ${LEVEL}% Connect power immediately"
    elif [ "$LEVEL" -le "$LOW" ]; then
        notify-send -u normal "Battery Low" "Battery at ${LEVEL}%"
    fi
fi
