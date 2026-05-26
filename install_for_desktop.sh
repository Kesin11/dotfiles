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
ln -is ~/dotfiles/.gitignore_global .
ln -is ~/dotfiles/.dircolors .
ln -is ~/dotfiles/.bash_aliases .
ln -fs ~/dotfiles/aqua.yaml .

cp -i ~/dotfiles/.gitconfig .

if [ `uname` = "Darwin" ]; then
  # KeyRepeat settings
  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 2

  # Create .bashrc_local
  cp -i ~/dotfiles/.bashrc_mac ~/.bashrc_local

  # Setup nested gitconfig
  mkdir -p ~/dotfiles/com/kesin11
  git config --global includeIf."gitdir:~/github/com/kesin11/**".path ~/dotfiles/.gitconfig_personal
  mkdir -p ~/dotfiles/com/kesin11-private
  git config --global includeIf."gitdir:~/github/com/kesin11-private/**".path ~/dotfiles/.gitconfig_personal
  git config --global includeIf."gitdir:~/dotfiles/**".path ~/dotfiles/.gitconfig_personal

  # Install homebrew and bottles
  sh ~/dotfiles/brew-install.sh

  # Change default shell zsh to homebrew bash
  sudo bash -c 'echo /opt/homebrew/bin/bash >> /etc/shells'
  chsh -s /opt/homebrew/bin/bash

elif [ `uname` = "Linux" ]; then
  cp -i ~/dotfiles/.bashrc_linux .bashrc_local
fi

echo "-----Finish!!------"
