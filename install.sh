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
ln -fs $SCRIPT_DIR/aqua.yaml .
# Use default .bashrc in Codespaces or devcontainer environment
# ln -fs $SCRIPT_DIR/.bashrc .
# ln -fs $SCRIPT_DIR/.bashrc_linux .bashrc_local

# but add little config to default .bashrc
echo '---- Append config from install.sh ---'
echo 'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"' >> ~/.bashrc
echo 'shopt -u histappend' >> ~/.bashrc

# Setup tools
# https://asdf-vm.com/guide/getting-started.html
echo "Install asdf..."
if [ ! -d "${HOME}/.asdf" ]; then
   git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
   echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
fi
# https://aquaproj.github.io/docs/products/aqua-installer#shell-script
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.2/aqua-installer | bash
echo 'export PATH=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH' >> ~/.bashrc
echo 'export AQUA_GLOBAL_CONFIG=${HOME}/aqua.yaml' >> ~/.bashrc

# Install tools from aqua.yaml with aqua global install
export PATH=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH
aqua i -l -a

# Change timezone
sudo ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

echo "-----Finish!!------"
