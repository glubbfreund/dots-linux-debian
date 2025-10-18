# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# history size
export HISTSIZE=10000
export HISTFILESIZE=50000

# other variables
export EDITOR="/usr/bin/emacs -nw"
export SUDO_PROMPT="$(tput setaf 1 bold)Password:$(tput sgr0) "

# Alias section
alias ls='ls --color=auto'
alias grep='grep --color=always'
alias less='less -R'
alias ..="cd .."
alias j="z"
alias ec="emacsclient --tty"
alias ecc="emacsclient -c"
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# No second tab, show instant
bind 'set show-all-if-ambiguous on'
# Case insensitive searching
bind 'set completion-ignore-case on'
# fix the text allready written
bind 'set menu-complete-display-prefix on'
# Use tab to menu complete
bind '"\t": menu-complete'
# shift-tab backwards menu complete
bind '"\e[Z": menu-complete-backward'
# Up and down for history search with context in mind
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Shortcut for change dir
shopt -s autocd
# allows access to all items with **
shopt -s globstar
# enable dir spell help
shopt -s dirspell
# replace vars
shopt -s direxpand

# load git completions prompt modules only if installed
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
fi

# Command prompt formatting function
update_prompt() {
  local EXIT=$?
  local DIR_COLOR="\[\033[31m\]"
  local OK_COLOR="\[\e[90m\]"
  local ERR_COLOR="\[\e[31m\]"
  local RESET="\[\e[0m\]"
  local GIT=""
  local COLOR_GIT="\[\e[38;5;214m\]"

  # git repo string
  local GIT="$(__git_ps1 '%s')"
  if [[ ! -z $GIT ]];then
      local GIT="$COLOR_GIT$GIT"
      local GIT="${GIT//[[:space:]]/} "
      local GIT="${GIT//=/}"
  fi

  # check error code and set colors
  if [[ $EXIT -eq 0 ]]; then
    PS1="${DIR_COLOR}\w ${GIT}${OK_COLOR}# ${RESET}"
  else
    PS1="${DIR_COLOR}\w ${GIT}${ERR_COLOR}# ${RESET}"
  fi

  # Space after each prompt section
  echo
}

# run for every prompt
PROMPT_COMMAND=update_prompt

# Setup fzf
eval "$(fzf --bash)"
# Setup zoxide
eval "$(zoxide init bash)"
