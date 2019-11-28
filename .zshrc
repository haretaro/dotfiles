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
