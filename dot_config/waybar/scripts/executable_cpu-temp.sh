#!/bin/bash
dir=$(dirname "$(grep -rl '^coretemp$' /sys/class/hwmon/*/name | head -1)")
temp=$(($(cat "$dir/temp1_input") / 1000))
if [ "$temp" -ge 82 ]; then
  printf '{"text":"󰈸 %d°","class":"critical"}\n' "$temp"
else
  printf '{"text":"󰈸 CPU %d°","class":"normal"}\n' "$temp"
fi
