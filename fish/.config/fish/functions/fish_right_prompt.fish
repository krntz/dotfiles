function fish_right_prompt
    set pyenv_version (pyenv version-name | string split ':')
    echo "$pyenv_version "
end
