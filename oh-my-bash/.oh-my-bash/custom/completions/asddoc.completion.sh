#!/usr/bin/env bash

_asddoc_completion()
{
    IFS=$'\n'
    docs=($(cd ~/Dropbox/; find . -maxdepth 2 -not -wholename '*/.*' | cut -c 3- | sed 's/\.md$//' | sort))

    # убрать name/name.md
    len=${#docs[@]}
    for (( i=0; i<${len}; i++ )); do
        IFS='/' read -r -a name <<< "${docs[$i]}"
        if [[ ${name[0]} != ${name[1]} ]]; then
            IFS=$'\n' filtered_docs+=(${docs[$i]}) # нужно определять IFS иначе ${docs[$i]} считается как два элмента массива, а не один
        fi
    done

    doc=$(printf "%s\n" "${filtered_docs[@]}" | fzf --layout=reverse-list)
    if [[ -z $doc ]]; then
        return
    fi
    asddoc "$doc"
    COMPREPLY=("$doc")
}

complete -F _asddoc_completion asddoc
