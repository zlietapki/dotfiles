#!/usr/bin/env bash

# Ждёт когда откроется окно класса my.terminal и включит US раскладку.
# запоминает раскладку до включения US и восстанавливает её после выхода из терминала

# run once
PID_FILE="${XDG_RUNTIME_DIR}/terminal_us_layout.pid"
TERMINAL_CLASS="my.terminal"

cleanup() {
    rm -f "$PID_FILE"
}
trap cleanup EXIT INT TERM

if [[ -f "$PID_FILE" ]]; then
    exit
fi
echo $$ > "$PID_FILE"

errcho(){ >&2 echo "$@"; }

RESTORE_KEYMAP=0
PREV_KEYMAP=0

get_keymap() {
    local keymap
    keymap=$(hyprctl -j devices | jq -r '.keyboards | .[] | select(.main == true) | .active_keymap')
    if [[ "$keymap" == "English (US)" ]]; then
        echo 0
    else 
        echo 1
    fi
}

set_keymap() {
    hyprctl switchxkblayout "$(hyprctl -j devices | jq -r '.keyboards | .[] | select(.main == true) | .name')" "$1" &>/dev/null # включить раскладку 0
}

activewindow() {
    # WINDOWCLASS,WINDOWTITLE
    # activewindow>>my.terminal,bash 123.bash

    local params_str
    params_str="${1#activewindow>>}" # remove prefix
    local params_arr
    IFS="," read -ra params_arr <<< "$params_str" # , separator

    if [[ ${params_arr[0]} = "$TERMINAL_CLASS" ]]; then
        PREV_KEYMAP=$(get_keymap)
        RESTORE_KEYMAP=1
        set_keymap '0' # включить раскладку 0
    else
        if [[ "$RESTORE_KEYMAP" == 1 ]]; then
            RESTORE_KEYMAP=0
            set_keymap "$PREV_KEYMAP"
        fi
    fi
}

handle() {
  case $1 in
    'activewindow>>'*)
        activewindow "$1"
        ;;
  esac
}

socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
