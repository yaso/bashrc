# ~/.bashrc: executed by bash(1) for non-login shells.
# yasodara.cordova@gmail.com

# see also the "/etc/issue" and "/etc/motd" files
#     http://www.linuxquestions.org/questions/linux-newbie-8/how-to-setup-system-login-banner-and-login-message-298266/

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

function ps_exit() {
    a=$?
    if [ $a -ne 0 ]; then
        echo "/(T_T)\\"
    else
        echo "\\(^o^)/"
    fi
    exit $a;
}
PS_EXIT="\$(ps_exit)"

#######################################
# history
#######################################

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
    else
  color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Set editor
export EDITOR=/usr/bin/vim

CYAN='\e[0;36m'
GRAY='\[\033[0m\]'
GREEN='\[\033[0;32m\]'
PURPLE='\[\033[0;35m\]'
RED='\e[0;31m'

echo

# Change bash prompt:
#    things you can do: http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
# the original had a <3, but I updated to the λ and it is classy that way 
PS1="${GRAY}\T ${GREEN}\u ${RED}\W ${PURPLE}λ ${GRAY} "

#######################################
# git alias goes here
#######################################
alias gadd='git add'
alias gbr='git br' 
alias gdiff='git diff' 
alias gdc='git diff --cached' 
alias glog='git log'
alias gpull='git pull' 
alias gstatus='git status' 
alias gstash='git stash' 
alias gpomaster='git pull origin master'
alias gbranchv='git branch -vv' 

