#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
"$HOME/.profile"

brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/versions

# TODO: move to separate files
# brew install bash-completion
# brew install brew-cask
# brew install dos2unix
# brew install gcc
# brew install git
# brew install graphviz
# brew install imagemagick
# brew install libxml2
# brew install libyaml
# brew install nvm
# brew install p7zip
# brew install phantomjs
# brew install php56-xdebug
# brew install rbenv
# brew install ruby-build
# brew install shellcheck
# brew install --HEAD tidy
# brew install tree
# brew install wget
