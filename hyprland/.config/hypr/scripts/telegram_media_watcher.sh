#!/usr/bin/env bash

# Ждёт когда откроется workspace special:telegram_viewer и запоминает окно на нём.
# Когда окно закроется, откроет workspace special:telegram

# run once
PID_FILE="${XDG_RUNTIME_DIR}/telegram_media_wather.pid"

cleanup() {
    rm -f "$PID_FILE"
}
trap cleanup EXIT INT TERM

if [[ -f "$PID_FILE" ]]; then
    exit
fi
echo $$ > "$PID_FILE"

TELEGRAM_VIEWER_WINADDRESS=0

openwindow() {
    # WINDOWADDRESS,WORKSPACENAME,WINDOWCLASS,WINDOWTITLE
    # openwindow>>556887e52500,special:telegram_viewer,org.telegram.desktop,Media viewer
    params_str="${1#openwindow>>}" # remove prefix
    IFS="," read -ra params_arr <<< "$params_str"

    if [[ ${params_arr[1]} = "special:telegram_viewer" ]]; then
        TELEGRAM_VIEWER_WINADDRESS=${params_arr[0]}
    fi
}

closewindow() {
    # WINDOWADDRESS
    # closewindow>>556887e52500
    params_str="${1#closewindow>>}" # remove prefix
    IFS="," read -ra params_arr <<< "$params_str"
    
    if [[ ${params_arr[0]} = "$TELEGRAM_VIEWER_WINADDRESS" ]]; then
        TELEGRAM_VIEWER_WINADDRESS=0
        hyprctl dispatch workspace special:telegram &> /dev/null
    fi
}

handle() {
  case $1 in
    openwindow*)
        openwindow "$1"
        ;;
    closewindow*)
        closewindow "$1"
        ;;
  esac
}

socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
