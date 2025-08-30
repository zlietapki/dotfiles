#!/bin/env bash

# Reload waybar whenever its config files change

CONFIG_FILES="$HOME/.config/waybar/config $HOME/.config/waybar/style.css $HOME/.config/waybar/modules"

waybar &
while true; do
    inotifywait -e modify ${CONFIG_FILES} 2>&1
    killall -SIGUSR2 waybar || exit
done
