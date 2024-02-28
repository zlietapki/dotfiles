#!/usr/bin/env bash

alias fkill='kill'

_fkill_completion()
{
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        pid=$(echo $pid | tr -d '\n')
        COMPREPLY=("$pid")
    fi
}

complete -F _fkill_completion fkill
