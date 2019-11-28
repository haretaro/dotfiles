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
