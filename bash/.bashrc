# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export HISTSIZE=1000000
export HISTFILESIZE=1000000

alias 'v'=vim
alias 'z'=zathura
alias 'i3config'='vim $HOME/.config/i3/config'
alias 'polybarconfig'='vim $HOME/.config/polybar/config'
alias 'vimconfig'='vim $HOME/.vimrc'

export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'


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

