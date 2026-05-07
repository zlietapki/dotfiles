#!/bin/bash
CONNECTED=$(bluetoothctl devices Connected 2>/dev/null | head -1)
if [ -z "$CONNECTED" ]; then
    echo '{"text":"","class":"hidden"}'; exit 0
fi

MAC=$(echo "$CONNECTED" | awk '{print $2}')
NAME=$(echo "$CONNECTED" | cut -d' ' -f3-)
DEV_SUFFIX=$(echo "$MAC" | tr ':' '_')

DBUS_PATH=$(busctl tree org.bluez 2>/dev/null | grep -o "/org/bluez/[^/]*/dev_${DEV_SUFFIX}" | head -1)

if [ -z "$DBUS_PATH" ]; then
    echo '{"text":"","class":"hidden"}'; exit 0
fi

BATTERY=$(busctl get-property org.bluez "$DBUS_PATH" org.bluez.Battery1 Percentage 2>/dev/null | awk '{print $2}')

if [ -z "$BATTERY" ]; then
    BATTERY=$(bluetoothctl info "$MAC" 2>/dev/null | grep -i "Battery Percentage" | grep -o '[0-9]*' | head -1)
fi

if [ -z "$BATTERY" ]; then
    echo '{"text":"","class":"hidden"}'; exit 0
fi

if   [ "$BATTERY" -ge 80 ]; then ICON="󰁹"
elif [ "$BATTERY" -ge 60 ]; then ICON="󰂁"
elif [ "$BATTERY" -ge 40 ]; then ICON="󰁾"
elif [ "$BATTERY" -ge 20 ]; then ICON="󰁻"
else ICON="󰁺"; fi

CLASS="bt-battery"
[ "$BATTERY" -le 20 ] && CLASS="bt-battery critical"
[ "$BATTERY" -le 40 ] && [ "$BATTERY" -gt 20 ] && CLASS="bt-battery warning"

echo "{\"text\":\"󰋋 $ICON $BATTERY%\",\"tooltip\":\"$NAME: $BATTERY%\",\"class\":\"$CLASS\"}"
