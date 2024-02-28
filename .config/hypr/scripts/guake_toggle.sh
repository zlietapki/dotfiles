#!/bin/bash

hyprctl dispatch togglespecialworkspace guake

#terminals_cnt=$(hyprctl clients -j | jq '[.[] | select(.workspace.name == "special:guake" and .class=="kitty")] | length')
#if [ $terminals_cnt -eq 0 ]
#then
#    hyprctl dispatch exec [workspace special:guake] kitty
#fi