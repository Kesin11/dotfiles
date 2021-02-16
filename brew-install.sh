#!/bin/sh

if ! which brew >& /dev/null;then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

# CLI
brew install bash-completion
brew install git
brew install git-lfs
brew install hub
brew install gh
brew install jq
brew install vim
brew install rbenv
brew install nvm
brew install circleci
brew install peco
brew install google-cloud-sdk
brew install robotsandpencils/made/xcodes
brew install ncdu
brew install pstree
brew install shellcheck
brew install delta

# Dev app
brew install visual-studio-code
brew install iterm2
brew install --cask docker

# Utility app
brew install boostnote
brew install bettertouchtool
brew install jasper
brew install google-chrome
brew install google-chrome-canary
brew install zoomus

# IME, fonts
brew install google-japanese-ime
brew install homebrew/cask-fonts/font-ricty-diminished

# Add symlink
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

# Additional
# brew install android-studio
# brew install vagrant
# brew install virtualbox
# brew install virtualbox-extension-pack
