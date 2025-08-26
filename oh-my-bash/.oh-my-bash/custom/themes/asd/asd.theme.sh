#! bash oh-my-bash.module

# SOLARIZED
BASE03=$(tput setaf 234)
BASE02=$(tput setaf 235)
BASE01=$(tput setaf 240)
BASE00=$(tput setaf 241) # body text / default code / primary content
BASE0=$(tput setaf 244)
BASE1=$(tput setaf 245) # comments / secondaty content
BASE2=$(tput setaf 254) # backgroud highlights
BASE3=$(tput setaf 230) # backgroud
YELLOW=$(tput setaf 136)
ORANGE=$(tput setaf 166)
RED=$(tput setaf 160)
MAGENTA=$(tput setaf 125)
VIOLET=$(tput setaf 61)
BLUE=$(tput setaf 33)
CYAN=$(tput setaf 37)
GREEN=$(tput setaf 64)

BG_BASE2="$(tput setab 254)"

OCEAN_BLUE1=$(tput setaf 39)
OCEAN_BLUE2=$(tput setaf 69)
OCEAN_BLUE3=$(tput setaf 105)

BOLD=$(tput bold)
UNDERLINE_START=$(tput smul)
UNDERLINE_END=$(tput rmul)

RESET=$(tput sgr0)

# SCM_THEME_PROMPT_PREFIX=" ${_omb_prompt_purple}"
SCM_THEME_PROMPT_PREFIX=" ${VIOLET}"
SCM_THEME_PROMPT_SUFFIX=""
SCM_THEME_PROMPT_DIRTY=" $RED✗"
SCM_THEME_PROMPT_CLEAN=" $GREEN✓"
SCM_GIT_SHOW_DETAILS="false"

function _omb_theme_PROMPT_COMMAND() {
  case $HOSTNAME in
    'box')
      ps_user_name="";
      ps_user_at="";
      ps_user_host="";
      ps_user_path="${BLUE}\w";
      
      ps_user_mark=" ${BASE1}> ${RESET}";

      ps_root_name="${RED}\u";
      ps_root_at="";
      ps_root_host="";
      ps_root_path=" ${ORANGE}\w";
      ps_root_mark=" ${ORANGE}# ${RESET}"
    ;;
    *)
      ps_user_name="\u";
      ps_user_at="@";
      ps_user_host="\h";
      ps_user_path=" ${CYAN}\w";
      
      ps_user_mark=" ${BASE1}> ${RESET}";

      ps_root_name="${RED}\u";
      ps_root_at="@";
      ps_root_host="\h";
      ps_root_path=" ${ORANGE}\w";
      ps_root_mark=" ${ORANGE}# ${RESET}"
  esac

  case $(id -u) in
    0) PS1="$ps_root_name$ps_root_at$ps_root_host$ps_root_path$(scm_prompt_info)$ps_root_mark${BASE00}"; # root
        ;;
    *) PS1="${BASE00}$ps_user_name$ps_user_at$ps_user_host$ps_user_path$(scm_prompt_info)$ps_user_mark${BASE00}";
        ;;
  esac
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
PROMPT_DIRTRIM=0 # не сокращать полный путь папки
