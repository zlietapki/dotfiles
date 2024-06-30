#! bash oh-my-bash.module

BASE03=$(tput setaf 234)
BASE02=$(tput setaf 235)
BASE01=$(tput setaf 240)
BASE00=$(tput setaf 241)
BASE0=$(tput setaf 244)
BASE1=$(tput setaf 245)
BASE2=$(tput setaf 254)
BASE3=$(tput setaf 230)
YELLOW=$(tput setaf 136)
ORANGE=$(tput setaf 166)
RED=$(tput setaf 160)
MAGENTA=$(tput setaf 125)
VIOLET=$(tput setaf 61)
BLUE=$(tput setaf 33)
CYAN=$(tput setaf 37)
GREEN=$(tput setaf 64)

OCEAN_BLUE1=$(tput setaf 39)
OCEAN_BLUE2=$(tput setaf 69)
OCEAN_BLUE3=$(tput setaf 105)

BOLD=$(tput bold)
RESET=$(tput sgr0)

# SCM_THEME_PROMPT_PREFIX=" ${_omb_prompt_purple}"
SCM_THEME_PROMPT_PREFIX=" \[$VIOLET\]"
SCM_THEME_PROMPT_SUFFIX=" ${_omb_prompt_normal}"
SCM_THEME_PROMPT_DIRTY=" \[$RED\]✗"
SCM_THEME_PROMPT_CLEAN=" \[$GREEN\]✓"
SCM_GIT_SHOW_DETAILS="false"

function _omb_theme_PROMPT_COMMAND() {
  #PS1="${_omb_prompt_olive}\u${_omb_prompt_normal}${_omb_prompt_teal}@\h${_omb_prompt_normal}${_omb_prompt_purple} ${_omb_prompt_normal}${_omb_prompt_green}\w${_omb_prompt_normal}$(scm_prompt_info)> "
  #PS1="${_omb_prompt_olive}\u${_omb_prompt_normal}${_omb_prompt_teal}@\h${_omb_prompt_normal}${_omb_prompt_purple} ${_omb_prompt_normal}${_omb_prompt_green}\w${_omb_prompt_normal}$(scm_prompt_info)> "
  # PS1="\[$BOLD$GREEN\]\u\[$GREEN\]@\[$GREEN\]\h \[$BLUE\]\w\[$RESET\]$(scm_prompt_info)\[$RESET\]> "
  # PS1="\[$BOLD$GREEN\]\u\[$YELLOW\]@\[$GREEN\]\h \[$BLUE\]\w\[$RESET\]$(scm_prompt_info)\[$RESET\]> "
  PS1="\[$BOLD$OCEAN_BLUE1\]\u\[$OCEAN_BLUE2\]@\[$OCEAN_BLUE3\]\h \[$BLUE\]\w\[$RESET\]$(scm_prompt_info)\[$RESET\]> "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
