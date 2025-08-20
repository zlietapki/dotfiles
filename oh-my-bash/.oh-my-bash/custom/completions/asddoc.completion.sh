#!/usr/bin/env bash

DIR=$HOME/Dropbox

get_docs() {
    mapfile -t docs < <(cd "$DIR" || exit 1; find . -maxdepth 2 -not -wholename '*/.*' | cut -c 3- | sed 's/\.md$//' | sort)

    # убрать name/name
    for doc in "${docs[@]}"; do
        IFS='/' read -ra name <<< "$doc"
        [[ ${name[0]} = "${name[1]}" ]] || filtered_docs+=("$doc")
    done
    printf "%s\n" "${filtered_docs[@]}" # convert array to string
}

_asddoc_completion()
{
    doc=$(get_docs | fzf --exact --layout=reverse-list --query "${COMP_WORDS[COMP_CWORD]}")
    if [ "x$doc" != "x" ]; then
        COMPREPLY=("$doc")
    fi
}

complete -F _asddoc_completion asddoc
