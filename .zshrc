if [[ `uname` == "Linux" ]]; then
    alias ls='ls -F --color=auto'
elif [[ `uname` == "Darwin" ]]; then
    # Mac のとき
    alias ls='ls -FG'

    # zsh-completion
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

source ~/dotfiles/git-prompt.sh
fpath=(~/.zsh $fpath)
autoload -U compinit
compinit -u
GIT_PS1_SHOWDIRTYSTATE=true
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f %F{blue}%~%f %F{red}$(__git_ps1 " (%s)")%f
$ '
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
