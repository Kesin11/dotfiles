#!/bin/bash
set -euo pipefail
set -x

sudo apt update
sudo apt install -y \
    apt-transport-https gnupg2

# git: https://git-scm.com/download/linux
sudo add-apt-repository -y ppa:git-core/ppa

# gh: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# kubectl: https://kubernetes.io/ja/docs/tasks/tools/install-kubectl/
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

sudo apt update
sudo apt install -y \
    jq ncdu psmisc build-essential \
    git gh \
    kubectl

# rbenv: https://github.com/rbenv/rbenv-installer#rbenv-installer
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
# pyenv: https://github.com/pyenv/pyenv-installer
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
# nvm: https://github.com/nvm-sh/nvm#install--update-script
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# circleci: https://circleci.com/docs/2.0/local-cli/#alternative-installation-method
curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | sudo bash

# tfenv: https://github.com/tfutils/tfenv
git clone https://github.com/tfutils/tfenv.git ~/.tfenv

# git-delta
curl -fsSL https://github.com/dandavison/delta/releases/download/0.12.1/git-delta_0.12.1_arm64.deb -o /tmp/git-delta.deb
sudo dpkg -i /tmp/git-delta.deb

# yq: https://github.com/mikefarah/yq
curl -fsSL https://github.com/mikefarah/yq/releases/download/v4.24.5/yq_linux_arm64 -o /tmp/yq
sudo install /tmp/yq /usr/local/bin/yq

# kustomize
curl -fsSL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.5.4/kustomize_v4.5.4_linux_arm64.tar.gz | tar zx -C /tmp
sudo install /tmp/kustomize /usr/local/bin/kustomize
