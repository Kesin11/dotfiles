#!/bin/bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

if ! which brew >& /dev/null;then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ "$(uname)" == "Linux" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get update
  sudo apt-get install -y --no-install-recommends build-essential
fi

brew update
cd $script_dir
brew bundle

echo "Run brew doctor..."
brew doctor

# Add symlink
# ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
