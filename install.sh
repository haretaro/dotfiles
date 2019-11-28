#!/bin/sh

if [[ `uname` == "Darwin" ]]; then  # Mac のとき
    brew install zsh-completion
fi

# setup vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# download git-prompt
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -O git-completion.zsh
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O git-prompt.sh
mkdir -p ~/.zsh
cp git-completion.zsh ~/.zsh
cp git-completion.bash ~/.zsh

# pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# link
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
