#!/bin/bash
set -u

# Install script for VSCode Remote Container or Codespaces

# Local USAGE:
#   ~/dotfiles/install.sh
#   source ~/.profile

if [[ $(devcontainer-info | grep -i codespaces) ]]; then
   echo "Setup for Codespaces..."
   IS_CODESPACES=1
   BIN_DIR=/home/codespace/.local/bin
else
   echo "Setup for Ubuntu based devcontainer..."
   IS_DEVCONTAINER=1
   BIN_DIR=/usr/local/bin
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

cd ~/
ln -fs $SCRIPT_DIR/.inputrc .
ln -fs $SCRIPT_DIR/.gitconfig .
ln -fs $SCRIPT_DIR/.gitignore_global .
# Use default .bashrc in Codespaces or devcontainer environment
# ln -fs $SCRIPT_DIR/.bashrc .
# ln -fs $SCRIPT_DIR/.bashrc_linux .bashrc_local

# but add little config to default .bashrc
echo '---- Append config from install.sh ---'
echo 'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"' >> ~/.bashrc
echo 'shopt -u histappend' >> ~/.bashrc

# Setup tools
echo "Install git-delta..."
if [ ! -e $BIN_DIR/delta ]; then
   wget -q -O /tmp/delta.tar.gz https://github.com/dandavison/delta/releases/download/0.8.3/delta-0.8.3-x86_64-unknown-linux-gnu.tar.gz
   tar zxvf /tmp/delta.tar.gz -C /tmp/
   sudo mv /tmp/delta-0.8.3-x86_64-unknown-linux-gnu/delta "${BIN_DIR}/"
fi

# https://asdf-vm.com/guide/getting-started.html
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc

# Change timezone
sudo ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

echo "-----Finish!!------"
