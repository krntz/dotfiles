# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1="\[$(tput bold)\]\u@\h: \w\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"

alias 'v'=vim
export TERM=xterm-256color
