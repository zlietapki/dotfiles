# /etc/bash/bashrc

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

pathadd() {
	if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
		PATH="$1${PATH:+":$PATH"}"
	fi
}

pathadd "/usr/bin/vendor_perl"
pathadd "$HOME/go/bin"
pathadd "/usr/local/go/bin"
pathadd "$HOME/.local/bin"
pathadd "$HOME/.local/share/JetBrains/Toolbox/scripts"
pathadd "$HOME/.cargo/bin"

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
[[ $- != *i* ]] && return

# cursor to bottom
# $(tput lines) - terminal height
for _ in $(seq 2 $(tput lines)); do # seq FIRST LAST. FIRST is 2 to skip one line
	echo
done

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Disable completion when the input buffer is empty.  i.e. Hitting tab
# and waiting a long time for bash to expand all of $PATH.
shopt -s no_empty_cmd_completion

# Enable history appending instead of overwriting when exiting.  #139609
shopt -s histappend

# не показывать имена переменных при cd <tab>
shopt -u cdable_vars

if command -v vivid &>/dev/null; then
	export LS_COLORS=$(vivid generate one-dark)
fi

if command -v starship &>/dev/null; then
	eval "$(starship init bash)"
fi

# Aliases

if command -v eza &>/dev/null; then
	# ls ll aliases for eza
	alias ls='eza --all --group-directories-first'
	ll() {
		if [[ $1 = '-t' ]]; then # ll -t - sort by modified
			shift
			eza --long --all --group-directories-first --time-style=long-iso --git-repos-no-status --sort=modified $@
		else
			eza --long --all --group-directories-first --time-style=long-iso --git-repos-no-status $@
		fi
	}
	# eza completions for ls ll
	if [[ -r /usr/share/bash-completion/completions/eza ]]; then
    . /usr/share/bash-completion/completions/eza && complete -F _eza eza ll ls
	fi
else
	# regular ls ll
	alias ls='LC_COLLATE=C ls -A --group-directories-first --color=auto'
	alias ll='LC_COLLATE=C ls -lA --group-directories-first --color=auto'
fi

alias diff='diff --color'
alias sudo='sudo ' # позволяет вызывать `sudo ll`

alias ctl='systemctl'
if [[ -r /usr/share/bash-completion/completions/systemctl ]]; then
    . /usr/share/bash-completion/completions/systemctl && complete -F _systemctl systemctl ctl
fi

alias journalctl='journalctl -o short-iso'

alias swaync-reload='swaync-client --reload-css; swaync-client --reload-config'

# alias vpn='sslocal -b "0.0.0.0:1080" --server-url "$(cat ~/.config/sirius_vpn/ger)"' # shadowsocks-rust
alias vpn-brave='brave --proxy-server="socks5://127.0.0.1:1080"'
alias vpn-chrome='google-chrome-stable --proxy-server="socks5://127.0.0.1:2080"'
alias vpn-yay='https_proxy=socks5://127.0.0.1:2080 http_proxy=socks5://127.0.0.1:2080 yay'
alias vpn-wget='http_proxy=http://127.0.0.1:2080/ https_proxy=http://127.0.0.1:2080/ wget'

if command -v yt-dlp &>/dev/null; then
	alias yt-dlp-help='yt-dlp --cookies-from-browser=chrome -S ext:mp4:m4a --proxy=socks5://127.0.0.1:2080'
fi

alias mount2='sudo mount -o umask=0022,gid=asd,uid=asd'

# incluide my aliases
# for f in ~/.local/include/bash_aliases/*; do
# 	source $f;
# done

if command -v dust &>/dev/null; then
	alias du='\dust --reverse'
	alias dust='\dust --reverse'
fi

# color man. better use oh-my-bash plugin 'colored-man-pages'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

# fuzzy finder. enable fzf
[ -r /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -r /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash

if command -v task &>/dev/null; then
	eval "$(task --completion bash)"
fi

if [ -r $HOME/go/bin/gocomplete ]; then
	complete -C $HOME/go/bin/gocomplete go
fi

# сохранять текущую папку при выходе из yazi
if command -v yazi &>/dev/null; then
	function y() { #yazi
		local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
		yazi "$@" --cwd-file="$tmp"
		IFS= read -r -d '' cwd < "$tmp"
		[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
		rm -f -- "$tmp"
	}
fi

if command -v zoxide &>/dev/null; then
	eval "$(zoxide init bash)"
	alias cd='z'
fi

# цветной stderr
colorstderr()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31m&\e[m,'>&2)3>&1 # red stdout https://stackoverflow.com/questions/6841143/how-to-set-font-color-for-stdout-and-stderr
