#!/usr/bin/env sh

pkill -x "wlogout" && exit 0

layout="$HOME/.config/wlogout/layout_$1"
style="$HOME/.config/wlogout/style_$1.css"

if [ ! -f $layout ] || [ ! -f $style ] ; then
    echo "ERROR: Config $1 not found..."
    exit 1;
fi

# detect monitor res
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')
hypr_border=`hyprctl -j getoption decoration:rounding | jq '.int'`

export mgn=$(( y_mon * 30 / hypr_scale ))
export fntSize=$(( y_mon * 2 / 100 ))
export button_rad=$(( hypr_border * 8 ))

# eval config files
wlStyle=`envsubst < $style`

# launch wlogout
wlogout --buttons-per-row 4 --column-spacing 0 --row-spacing 0 --margin 0 --layout $layout --css <(echo "$wlStyle") --protocol layer-shell
