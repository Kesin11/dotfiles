#!/bin/sh

if ! which brew >& /dev/null;then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install bash-completion
brew install git
brew install hub
brew install jq
brew install vim
brew install rbenv
brew install nvm
brew install circleci
brew cask install visual-studio-code
brew cask install iterm2
brew cask install boostnote
brew cask install google-cloud-sdk
brew cask install docker
brew cask install google-japanese-ime
