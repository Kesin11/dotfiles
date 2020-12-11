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
brew cask install google-cloud-sdk
brew install robotsandpencils/made/xcodes

# Dev app
brew cask install visual-studio-code
brew cask install iterm2
brew cask install docker

# Utility app
brew cask install boostnote
brew cask install bettertouchtool
brew cask install jasper
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install divvy
brew cask install zoomus

# IME, fonts
brew cask install google-japanese-ime
brew cask install homebrew/cask-fonts/font-ricty-diminished

# Add symlink
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
