#!/bin/bash

# Install script for macOS or desktop Linux

# make synbolic link .vim first, because minpac will be installed into ~/.vim/
cd ~/
ln -is ~/dotfiles/.vim .

# minpac
cd ~/dotfiles
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac

cd ~/
ln -is ~/dotfiles/.bash_profile .
ln -is ~/dotfiles/.bashrc .
ln -is ~/dotfiles/.vimrc .
ln -is ~/dotfiles/.tmux.conf .
ln -is ~/dotfiles/.inputrc .
ln -is ~/dotfiles/.gitconfig .
ln -is ~/dotfiles/.gitignore_global .
ln -is ~/dotfiles/.dircolors .
ln -is ~/dotfiles/.bash_aliases .
ln -fs ~/dotfiles/aqua.yaml .

# tool
mkdir -p ~/dotfiles/tool
sh ~/dotfiles/tool/setup.sh

if [ `uname` = "Darwin" ]; then
  # KeyRepeat settings
  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 2

  ln -is ~/dotfiles/.bashrc_mac .bashrc_local
  sh ~/dotfiles/brew-install.sh
elif [ `uname` = "Linux" ]; then
  ln -is ~/dotfiles/.bashrc_linux .bashrc_local
fi

echo "-----Finish!!------"
echo "Replace .gitconfig to local one if you need use another one"
