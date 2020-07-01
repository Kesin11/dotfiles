#!/bin/bash

# USAGE: source ~/dotfiles/install_for_vscode_container.sh

cd ~/
ln -fs ~/dotfiles/.inputrc .
ln -fs ~/dotfiles/.bashrc .
ln -fs ~/dotfiles/.bashrc_linux .bashrc_local

# TODO: ubuntuだったら.bashrc_ubuntuを読み込んで、git diff highlightなどを読み込ませる

echo "-----Finish!!------"
