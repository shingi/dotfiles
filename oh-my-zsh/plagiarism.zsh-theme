# Yay! High voltage and arrows!

THM_GREEN="%{$fg[green]%}"
THM_YELLOW="%{$fg[yellow]%}"
THM_CYAN="%{$fg[cyan]%}"
THM_RED="%{$fg[red]%}"
THM_MAGENTA="%{$fg[magenta]%}"
RST_COL="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="$RST_COL$THM_GREEN"
ZSH_THEME_GIT_PROMPT_SUFFIX="$RST_COL"
ZSH_THEME_GIT_PROMPT_DIRTY="$THM_YELLOW⚡$RST_COL"
ZSH_THEME_GIT_PROMPT_CLEAN=""


PROMPT='$(prompt_status)$(virtualenv_prompt_info)$(prompt_context)$THM_CYAN${PWD/#$HOME/~}$RST_COL$THM_RED$(repo_char)$RST_COL$(parse_git_dirty)$THM_CYAN⇒$RST_COL '

#RPROMPT='[%*]'
RPROMPT='$THM_GREEN$(git_cust_prompt_info)$RST_COL${THM_CYAN}[%*]$RST_COL'



export VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="$THM_GREEN("
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=")$RST_COL"

function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo "$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
    fi
}




prompt_context() {
  local user=`whoami`
  local utok="${user:0:3}" #""
  local mtok="⌂"
  # if [[ -n "$SSH_CLIENT" ]]; then
  #   echo "$THM_MAGENTA%n$RST_COL$THM_CYAN@$RST_COL$THM_YELLOW%m$RST_COL$THM_RED:$RST_COL"
  #   #prompt_segment black default "%(!.$THM_YELLOW.)$user@%m"
  # elif [[ "$user" != "$DEFAULT_USER" ]]; then
  #   echo "$THM_MAGENTA%n$RST_COL$THM_CYAN@$RST_COL$THM_YELLOW⌂$RST_COL$THM_RED:$RST_COL"    
  # else #${USER:0:3}
  #   echo "$THM_MAGENTA$RST_COL$THM_CYAN@$RST_COL$THM_YELLOW⌂$RST_COL$THM_RED:$RST_COL"
  # fi

  if [[ -n "$SSH_CLIENT" ]]; then
    mtok="%m"
    utok="%n"
  elif [[ $user != "$DEFAULT_USER" ]]; then
    utok="%n"
  fi
  echo "$THM_MAGENTA$utok$RST_COL$THM_CYAN@$RST_COL$THM_YELLOW${mtok}$RST_COL$THM_RED:$RST_COL"
}


function git_cust_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function repo_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    #echo '○'
    echo '|'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  RETVAL=$?
  local symbols
  symbols=""
  [[ $RETVAL -ne 0 ]] && symbols+="$THM_RED✘$RETVAL $RST_COL"
  [[ $UID -eq 0 ]] && symbols+="$THM_YELLOW☢$RST_COL"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="$THM_GREEN⚙$RST_COL"

  [[ -n "$symbols" ]] && echo "$symbols" #prompt_segment black default "$symbols"
}