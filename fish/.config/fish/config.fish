if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx LANG en_US.UTF-8
end
abbr -a --position command bu 'brew update && brew upgrade'
abbr -a --position command v nvim
abbr -a --position command py python
abbr -a --position command gc 'git commit'
abbr -a --position command gs 'git status'
abbr -a --position command gd 'git diff'
abbr -a --position command gco 'git checkout'
abbr -a --position command ga 'git add'
abbr -a --position command gp 'git push'
abbr -a --position command gpu 'git pull'
abbr -a --position command gf 'git fetch'
