#!/bin/bash
echo alt_release >> /tmp/switch_window

# предыдущая была alt_tab_release
prev=$(tail -2 /tmp/switch_window | head -1)
if [[ $prev == "alt_tab_press" ]]; then
    echo "" > /tmp/switch_window
    addr=$(hyprctl clients -j | jq -r '.[] | select(.focusHistoryID == 0) | .address')
    hyprctl dispatch alterzorder top,address:$addr # текущее окно в топ стека
    # hyprctl notify 5 5000 0 "TOP IS $addr"
fi
