# /etc/bash/bashrc

#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

case ":${PATH}:" in
    *:"/usr/bin/vendor_perl":*)
        ;;
    *)
		if [[ -d /usr/bin/vendor_perl ]]; then
    		PATH=/usr/bin/vendor_perl:$PATH
		fi
        ;;
esac

# Go
case ":${PATH}:" in
    *:"$HOME/go/bin":*)
        ;;
    *)
		if [[ -d $HOME/go/bin ]]; then
    		PATH=$HOME/go/bin:$PATH
		fi
        ;;
esac
case ":${PATH}:" in
    *:"/usr/local/go/bin":*)
        ;;
    *)
		if [[ -d /usr/local/go/bin ]]; then
    		PATH=/usr/local/go/bin:$PATH
		fi
        ;;
esac

case ":${PATH}:" in
    *:"$HOME/.local/bin":*)
        ;;
    *)
		if [[ -d $HOME/.local/bin ]]; then
    		PATH=$HOME/.local/bin:$PATH
		fi
        ;;
esac

case ":${PATH}:" in
    *:"/home/asd/.local/share/JetBrains/Toolbox/scripts/":*)
        ;;
    *)
		if [[ -d /home/asd/.local/share/JetBrains/Toolbox/scripts/ ]]; then
    		PATH=/home/asd/.local/share/JetBrains/Toolbox/scripts/:$PATH
		fi
        ;;
esac

if [[ -f ~/.cargo/env ]]; then
    source ~/.cargo/env
fi

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
[[ $- != *i* ]] && return

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

# Save each command to the history file as it's executed.  #517342
# This does mean sessions get interleaved when reading later on, but this
# way the history is always up to date.  History is not synced across live
# sessions though; that is what `history -n` does.
# Disabled by default due to concerns related to system recovery when $HOME
# is under duress, or lives somewhere flaky (like NFS).  Constantly syncing
# the history will halt the shell prompt until it's finished.
#PROMPT_COMMAND='history -a'

#  ██████╗ ██╗  ██╗    ███╗   ███╗██╗   ██╗    ██████╗  █████╗ ███████╗██╗  ██╗
# ██╔═══██╗██║  ██║    ████╗ ████║╚██╗ ██╔╝    ██╔══██╗██╔══██╗██╔════╝██║  ██║
# ██║   ██║███████║    ██╔████╔██║ ╚████╔╝     ██████╔╝███████║███████╗███████║
# ██║   ██║██╔══██║    ██║╚██╔╝██║  ╚██╔╝      ██╔══██╗██╔══██║╚════██║██╔══██║
# ╚██████╔╝██║  ██║    ██║ ╚═╝ ██║   ██║       ██████╔╝██║  ██║███████║██║  ██║
#  ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝   ╚═╝       ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
# Path to your oh-my-bash installation.
export OSH='/home/asd/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="tonotdo"

# If you set OSH_THEME to "random", you can ignore themes you don't like.
# OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")

# Uncomment the following line to use case-sensitive completion.
# OMB_CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# OMB_HYPHEN_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you don't want the repository to be considered dirty
# if there are untracked files.
# SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"

# Uncomment the following line if you want to completely ignore the presence
# of untracked files in the repository.
# SCM_GIT_IGNORE_UNTRACKED="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.  One of the following values can
# be used to specify the timestamp format.
# * 'mm/dd/yyyy'     # mm/dd/yyyy + time
# * 'dd.mm.yyyy'     # dd.mm.yyyy + time
# * 'yyyy-mm-dd'     # yyyy-mm-dd + time
# * '[mm/dd/yyyy]'   # [mm/dd/yyyy] + [time] with colors
# * '[dd.mm.yyyy]'   # [dd.mm.yyyy] + [time] with colors
# * '[yyyy-mm-dd]'   # [yyyy-mm-dd] + [time] with colors
# If not set, the default value is 'yyyy-mm-dd'.
# HIST_STAMPS='yyyy-mm-dd'

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
# OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
# OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
#
# completions=(go git ssh rustup cargo)
completions=(
	go
	git
	ssh
	rustup
	cargo
	asddoc
	fkill
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
	general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	bashmarks
	sudo
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format:
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh
unset CDPATH # disable show path on `cd`

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"

# ███╗   ███╗██╗   ██╗
# ████╗ ████║╚██╗ ██╔╝
# ██╔████╔██║ ╚████╔╝ 
# ██║╚██╔╝██║  ╚██╔╝  
# ██║ ╚═╝ ██║   ██║   
# ╚═╝     ╚═╝   ╚═╝   
alias ll='lsd -la'
alias pacman-clean='pacs=$(pacman -Qqtd); [ $? ] || pacman -Rcns $pacs'
alias pacman-installed='expac --timefmt="%Y-%m-%d %T" "%l\t%n" $(pacman -Qqe) | sort -n' # только установленные явно
alias hcl='hyprctl clients -j | jq "[.[] | select(.workspace.id == $(hyprctl activeworkspace -j | jq .id))]"'
alias swaync-reload='swaync-client --reload-css; swaync-client --reload-config'
alias n='source ~/.local/bin/nnn'
alias rustc='rustc --color=never'

alias vpn='sslocal -b "0.0.0.0:1080" --server-url "$(cat ~/.config/sirius_vpn/ger)"'
alias vpn-brave='brave --proxy-server="socks5://127.0.0.1:1080"'
alias vpn-chrome='google-chrome-stable --proxy-server="socks5://127.0.0.1:2080"'
alias mount2='sudo mount -o umask=0022,gid=asd,uid=asd'
[ -f ~/.config/yay/updatethenupgrade.exp ] && alias updatethenupgrade='https_proxy=socks5://127.0.0.1:2080 http_proxy=socks5://127.0.0.1:2080 expect ~/.config/yay/updatethenupgrade.exp'
alias vpn-yay='https_proxy=socks5://127.0.0.1:2080 http_proxy=socks5://127.0.0.1:2080 yay'
command -v yt-dlp 2>&1>/dev/null && alias yt-dlp='command yt-dlp --cookies-from-browser=chrome -S ext:mp4:m4a --proxy=socks5://127.0.0.1:2080'

# color man
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

complete -C /home/asd/go/bin/gocomplete go

# fuzzy finder. enable fzf
[ -f ~/.config/fzf/completion.bash ] && source ~/.config/fzf/completion.bash
[ -f ~/.config/fzf/key-bindings.bash ] && source ~/.config/fzf/key-bindings.bash
