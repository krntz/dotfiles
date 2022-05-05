function fish_right_prompt
    if type -q pyenv
        set pyenv_version (pyenv version-name)
        if [ $pyenv_version != 'system:2.7.18' ]
            echo "$pyenv_version "
        end
    end
end
