# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias 'v'=vim
alias 'z'=zathura
alias 'i3config'='vim /home/akrantz/.config/i3/config'
alias 'polybarconfig'='vim /home/akrantz/.config/polybar/config'
alias 'vimconfig'='vim /home/akrantz/.vimrc'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1=" \w > "


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/akrantz/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/akrantz/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/akrantz/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/akrantz/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

