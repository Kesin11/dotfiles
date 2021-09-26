#!/bin/bash

# Install script for VSCode Remote Container or Codespaces

# Local USAGE:
#   ~/dotfiles/install.sh
#   source ~/.profile

if [[ $(devcontainer-info | grep -i codespaces) ]]; then
   echo "Setup for Codespaces..."
   IS_CODESPACES=1
else
   echo "Setup for Ubuntu based devcontainer..."
   IS_DEVCONTAINER=1
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

cd ~/
ln -fs $SCRIPT_DIR/.inputrc .
# Use default .bashrc in Codespaces or devcontainer environment
# ln -fs $SCRIPT_DIR/.bashrc .
# ln -fs $SCRIPT_DIR/.bashrc_linux .bashrc_local
ln -fs $SCRIPT_DIR/.gitconfig .

# Setup tools
echo "Install git-delta..."
if [ ! -e /usr/local/bin/delta ]; then
   wget -q -O /tmp/delta.tar.gz https://github.com/dandavison/delta/releases/download/0.8.3/delta-0.8.3-x86_64-unknown-linux-gnu.tar.gz
   tar zxvf /tmp/delta.tar.gz -C /tmp/
   mv /tmp/delta-0.8.3-x86_64-unknown-linux-gnu/delta /usr/local/bin/
fi

# Change timezone
if [[ -n "${IS_DEVCONTAINER}" ]]; then
   ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
fi

echo "-----Finish!!------"
