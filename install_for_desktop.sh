#!/bin/bash

# Install script for macOS or desktop Linux

# make synbolic link .vim first, because neobundle will install to .vim
cd ~/
ln -is ~/dotfiles/.vim .

# NeoBundle
cd ~/dotfiles
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | bash

cd ~/
ln -is ~/dotfiles/.bash_profile .
ln -is ~/dotfiles/.bashrc .
ln -is ~/dotfiles/.vimrc .
ln -is ~/dotfiles/.tmux.conf .
ln -is ~/dotfiles/.inputrc .
ln -is ~/dotfiles/.gitconfig .

# tool
mkdir -p ~/dotfiles/tool
sh ~/dotfiles/tool/setup.sh

if [ `uname` = "Darwin" ]; then
  # KeyRepeat settings
  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 2

  ln -is ~/dotfiles/.bashrc_mac .bashrc_local
  sh ~/dotfiles/brew-install.sh

  # vscode
  sh ~/dotfiles/vscode/setup.sh
elif [ `uname` = "Linux" ]; then
  ln -is ~/dotfiles/.bashrc_linux .bashrc_local
fi

echo "-----Finish!!------"
echo "Replace .gitconfig to local one if you need use another one"
