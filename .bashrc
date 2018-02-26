# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# http://www.garron.me/en/go2linux/what-is-my-public-ip-command-line.html
GetMyIP() {
    curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//';
}
# Get quote-of-the-day from Wikiquote:
# QuoteOfTheDay() {
#    if [ -z "$1" ]
#    then
#        curl -s https://en.wikiquote.org/wiki/Template:QoD | grep -A 6 \<td\> | sed 's/<[^>]\+>//g' | cowsay -f kilroy
#    else
#        curl -s https://en.wikiquote.org/wiki/Template:QoD | grep -A "$1" \<td\> | sed 's/<[^>]\+>//g' | cowsay -f kilroy
#    fi
#}

# taken from http://www.pixelbeat.org/settings/.bashrc
ord() { printf "0x%x\n" "'$1"; }
chr() { printf $(printf '\\%03o\\n' "$1"); }

# Change bash prompt:
#    things you can do: http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
#    colors: http://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# was >> (like MATLAB) until I changed PuTTY's settings to be able to use λ
# other characters: →
PS1="${GRAY}\T ${GREEN}\u ${RED}\W ${PURPLE}λ ${GRAY} "

#######################################
# git alias
#######################################
alias ga='git add'
alias gb='git br' 
alias gd='git diff' 
alias gdc='git diff --cached' 
alias gl='git log'
alias gp='git pull' 
alias gs='git status' 
alias gst='git stash' 
alias gplo='git pull origin master'
alias gbv='git branch -vv' 

