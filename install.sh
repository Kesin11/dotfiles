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

if [[ "${IS_CODESPACES:-}" == "1" ]]; then
   # https://mise.jdx.dev/getting-started.html
   echo "Install mise..."
   curl https://mise.run | sh
   echo "eval \"\$(/home/codespace/.local/bin/mise activate bash)\"" >> ~/.bashrc

   # Install git-delta
   mise use delta@latest
fi

# Change timezone
sudo ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

echo "-----Finish!!------"
