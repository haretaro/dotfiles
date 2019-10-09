if [[ `uname` == "Linux" ]]; then
    alias ls='ls -F --color=auto'
elif [[ `uname` == "Darwin" ]]; then
    # Mac のとき
    alias ls='ls -FG'

    # bash-completion
    [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
fi

source ~/dotfiles/git-prompt.sh
source ~/dotfiles/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
export EDITOR='vim'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# .ssh/config の Host に ping する
# https://superuser.com/questions/429470/is-there-a-utility-to-ping-a-server-using-aliases-in-ssh-config-instead-of-etc
ping()
{
    # Process args
    local i=0
    local options=""
    local host=""
    for arg
    do
        i=$(($i+1))
        if [ "$i" -lt "$#" ]
        then
            options="${options} ${arg}"
        else
            host="${arg}"
        fi
    done

    # Find host
    local hostname=$(awk "\$1==\"Host\" {host=\$2} \$1==\"HostName\" && host==\"${host}\" {print \$2}" "$HOME/.ssh/config")
    if [ -z "$hostname" ]
    then
        hostname="$host"
    fi

    # Run ping
    $(which ping) $options $hostname
}
