if status is-interactive
    # Commands to run in interactive sessions can go here
    if not type -q $pyenv
        set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1
        set -Ux PYENV_ROOT $HOME/.pyenv
        set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    end
end

if not type -q $pyenv
    alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
    status is-login; and pyenv init --path | source
    status is-interactive; and pyenv init - | source
end
