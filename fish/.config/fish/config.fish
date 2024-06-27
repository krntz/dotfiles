if status is-interactive
    # Commands to  run in interactive sessions can go here
end

set -g fish_greeting ""

set -gx EDITOR nvim
set -gx PAGER less

set -gx PROJECT_HOME ~/Projects

switch (uname -s)
    case Darwin
        # MacOS specific variables
        set -gx SHELL "/usr/local/bin/fish"
        set -gx BROWSER open
        abbr -a --position command bu "brew update && brew upgrade"
    case '*'
        # Variables for all other OS's
        set -gx SHELL "/usr/bin/fish"
end

abbr -a --position command v "nvim"
abbr -a --position command py "python"
abbr -a --position command gc "git commit"
abbr -a --position command gco "git checkout"
abbr -a --position command gd "git diff"
abbr -a --position command ga "git add"
abbr -a --position command gp "git push"
abbr -a --position command gpl "git pull"
abbr -a --position command gcl "git clone"
abbr -a --position command gs "git status"

zoxide init --cmd cd fish | source
