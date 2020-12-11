#!/bin/sh

if ! which brew >& /dev/null;then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# CLI
brew install bash-completion
brew install git
brew install hub
brew install jq
brew install vim
brew install rbenv
brew install nvm
brew install circleci
brew install peco
brew install google-cloud-sdk
brew install robotsandpencils/made/xcodes

# Dev app
brew install visual-studio-code
brew install iterm2
brew install docker

# Utility app
brew install boostnote
brew install bettertouchtool
brew install jasper
brew install google-chrome
brew install google-chrome-canary
brew install divvy
brew install zoomus

# IME, fonts
brew install google-japanese-ime
brew install homebrew/cask-fonts/font-ricty-diminished

# Add symlink
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
