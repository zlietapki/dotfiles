#!/usr/bin/env bash

OLDIFS=$IFS

PATH=/home/asd/.local/bin:/home/asd/go/bin:/usr/bin/vendor_perl:/usr/local/bin:/usr/bin

IFS=$'\n'
docs=($(cd ~/Dropbox/; find . -maxdepth 2 -not -wholename '*/.*' | cut -c 3- | sed 's/\.md$//' | sort))

# убрать name/name.md
len=${#docs[@]}
for (( i=0; i<${len}; i++ )); do
    IFS='/'
    read -r -a name <<< "${docs[$i]}"
    if [[ ${name[0]} != ${name[1]} ]]; then
        filtered_docs+=("${docs[$i]}")
    fi
done

selected_entered=$(printf "%s\n" "${filtered_docs[@]}" | rofi -p asddoc: -dmenu -format 's F')

[[ $? != 0 ]] && exit
IFS=' '
read -r selected entered <<< $selected_entered
entered=$(echo $entered | tr -d "'") # убрать кавычки

# если последний введенный символ пробел, то создать новую страницу
re_lastspace='\s$'
if [[ $entered =~ $re_lastspace ]]; then
    asddoc $entered
else
    asddoc $selected
fi
