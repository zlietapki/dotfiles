#!/usr/bin/env bash

usage() {
    echo "Converts document name to its filepath."
    echo
    echo "Usage: asddoc_rofi [-d|--dir=] <document>" 1>&2;
    echo "  OPTIONS:"
    echo "  -d DIR, --dir=DIR Set document dir to DIR (default is ~/Dropbox)"
    echo "  -h, --help This message"
    exit 1;
}

TEMP=$(getopt --options d:h --longoptions dir:,help --name 'asddoc' -- "$@") || exit 1;
eval set -- "$TEMP"

DIR=$HOME/Dropbox
while true; do
  case "$1" in
    -d | --dir ) DIR="$2"; shift 2;;
    -h | --help ) usage;;
    -- ) shift; break;;
    * ) break;;
  esac
done

get_docs() {
    mapfile -t docs < <(cd "$DIR" || exit 1; find . -maxdepth 2 -not -wholename '*/.*' | cut -c 3- | sed 's/\.md$//' | sort)

    # убрать name/name
    for doc in "${docs[@]}"; do
        IFS='/' read -ra name <<< "$doc"
        [[ ${name[0]} = "${name[1]}" ]] || filtered_docs+=("$doc")
    done
    printf "%s\n" "${filtered_docs[@]}" # convert array to string
}

selected_entered=$(get_docs | rofi -p asddoc: -dmenu -format 's F' 2>/dev/null) || exit 2

IFS=' ' read -r selected entered <<< "$selected_entered"
entered=$(echo "$entered" | tr -d "'") # убрать кавычки

# если последний введенный символ пробел, то создать новую страницу
if [[ $entered =~ [[:space:]]$ ]]; then
    DOC=${entered// /} # убрать пробелы
else
    DOC="$selected"
fi

IFS='/' read -ra names <<< "$DOC"
namesCnt=${#names[@]}

if [[ $namesCnt == 1 ]]; then
    echo "${DIR}/${names[0]}/${names[0]}.md"
    # echo "${DIR}/${DOC}/index.md"
elif [[ $namesCnt == 2 ]]; then
    echo "${DIR}/${names[0]}/${names[1]}.md"
else
    echo "Tree deeper then 2 is not suppoted";
    exit 1;
fi
