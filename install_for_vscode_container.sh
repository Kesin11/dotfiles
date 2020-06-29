#!/bin/bash

# USAGE: source ~/dotfiles/install_for_vscode_container.sh

cd ~/
ln -fs ~/dotfiles/.inputrc .
ln -fs ~/dotfiles/.bashrc_linux .bashrc_local

# dockerイメージにはデフォルトの.bashrcが存在するため、壊さないようにする
# ln -fs ~/dotfiles/.bashrc .
source ~/dotfiles/.bashrc

# TODO: ubuntuだったら.bashrc_ubuntuを読み込んで、git diff highlightなどを読み込ませる

echo "-----Finish!!------"
