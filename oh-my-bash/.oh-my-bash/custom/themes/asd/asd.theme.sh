#! bash oh-my-bash.module

# SOLARIZED
BASE03='\[\e[38;2;0;43;54m\]'
BASE02='\[\e[38;2;7;54;66m\]'
BASE01='\[\e[38;2;88;110;117m\]'
BASE00='\[\e[38;2;101;123;131m\]' # body text / default code / primary content
BASE0='\[\e[38;2;131;148;150m\]'
BASE1='\[\e[38;2;147;161;161m\]' # comments / secondaty content
BASE2='\[\e[38;2;238;232;213m\]' # backgroud highlights
BASE3='\[\e[38;2;253;246;227m\]' # backgroud
YELLOW='\[\e[38;2;181;137;0m\]'
ORANGE='\[\e[38;2;203;75;22m\]'
RED='\[\e[38;2;220;50;47m\]'
MAGENTA='\[\e[38;2;211;54;130m\]'
VIOLET='\[\e[38;2;108;113;196m\]'
BLUE='\[\e[38;2;38;139;210m\]'
CYAN='\[\e[38;2;42;161;152m\]'
GREEN='\[\e[38;2;133;153;0m\]'

BOLD=${_omb_prompt_bold}


RESET=${_omb_prompt_normal}

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
      
      ps_user_mark=" ${BASE1}> ";

      ps_root_name="${RED}\u";
      ps_root_at="@";
      ps_root_host="\h";
      ps_root_path=" ${ORANGE}\w";
      ps_root_mark=" ${ORANGE}# ${RESET}"
  esac

  case $(id -u) in
    0) PS1="${ps_root_name}${ps_root_at}${ps_root_host}${ps_root_path}$(scm_prompt_info)${ps_root_mark}${RESET}"; # root
        ;;
    *) PS1="${ps_user_name}${ps_user_at}${ps_user_host}${ps_user_path}$(scm_prompt_info)${ps_user_mark}${RESET}";
        ;;
  esac
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
PROMPT_DIRTRIM=0 # не сокращать полный путь папки
