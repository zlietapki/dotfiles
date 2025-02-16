#!/usr/bin/env bash

asddoc=$HOME/.local/bin/asddoc # важен полный путь. PATH здесь нет

mapfile -t docs < <(cd ~/Dropbox/ || exit 1; find . -maxdepth 2 -not -wholename '*/.*' | cut -c 3- | sed 's/\.md$//' | sort)

# убрать name/name
for doc in "${docs[@]}"; do
    IFS='/'
    read -ra name <<< "$doc"
    [[ ${name[0]} = "${name[1]}" ]] || filtered_docs+=("$doc")
done
docs=("${filtered_docs[@]}")

selected_entered=$(printf "%s\n" "${docs[@]}" | rofi -p asddoc: -dmenu -format 's F') || exit 2

IFS=' '
read -r selected entered <<< "$selected_entered"
entered=$(echo "$entered" | tr -d "'") # убрать кавычки

# если последний введенный символ пробел, то создать новую страницу
if [[ $entered =~ [[:space:]]$ ]]; then
    entered=${entered// /} # убрать пробелы
    # hyprctl notify -1 10000 "rgb(ff0000)" "fontsize:35 $entered"
    $asddoc "$entered"
else
    # hyprctl notify -1 10000 "rgb(ff0000)" "fontsize:35 $selected"
    $asddoc "$selected"
fi

hyprctl dispatch workspace special:codium
