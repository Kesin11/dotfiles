#!/bin/bash

# Install script for VSCode Remote Container or Codespaces

# Local USAGE:
#   ~/dotfiles/install.sh
#   source ~/.profile

cd ~/
ln -fs ~/dotfiles/.inputrc .
ln -fs ~/dotfiles/.bashrc .
ln -fs ~/dotfiles/.bashrc_linux .bashrc_local

sh ~/dotfiles/install-git-diff-highlight.sh

# Change timezone
if [ `whoami` = "root" ]; then
  ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
else
  export TZ="Asia/Tokyo"
fi

echo "-----Finish!!------"
