function fish_right_prompt
    if type -q pyenv
        set pyenv_version (pyenv version-name | string split ':')
        if [ $pyenv_version != "system" ]
            echo "$pyenv_version "
        end
    end
end
