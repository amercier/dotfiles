# Homebew-related utility functions
# =================================

# Whether a Brew keg exists
#
# @param 1 Keg name
# @returns `0` if the Brew keg exists, `1` otherwise
brew_keg_exists() {
  if [ -z "${BREW_PATH-}" ]
  then
    command_exists brew && [ -d "$(brew --prefix)/opt/$1" ]
  else
    [ -d "$BREW_PATH/$1" ]
  fi
}

# Upgrade a Cask
#
# @param 1 Cask name
brew_cask_upgrade() {
  if [ -n "$(brew cask outdated "$1")" ]; then
    echo "$1 is outdated, upgrading..."
    # brew cask reinstall $1
  else
    echo "$1 is up-to-date"
  fi
}

# Upgrade a Brew keg
#
# @param 1 Keg name
brew_upgrade() {
  if [ -n "$(brew outdated "$1")" ]; then
    echo "$1 is outdated, upgrading..."
    brew upgrade "$1" --cleanup
  else
    echo "$1 is up-to-date"
  fi
}

# Install or upgrade a Brew command
#
# @param 1 Brew keg name
install_or_update_brew_keg() {
  install_or_update brew_keg "$1" "$1" "brew install $1" "brew_upgrade $1"
}

# Install or upgrade a Brew service
#
# @param 1 Brew keg name
install_or_update_brew_service() {
  install_or_update brew_keg "$1" "$1" "brew install $1 && sudo brew services start $1" "brew_upgrade $1"
}

# Install or upgrade a Brew cask application
#
# @param 1 Cask name
# @param 2 Application name
install_or_update_brew_cask_application() {
  install_or_update application "$1" "$1" "brew cask install $2" "brew_cask_upgrade $2"
}

brew_cask_exists() {
  brew cask list | grep "$1" >/dev/null 2>&1
}

# Install or upgrade a Brew cask
#
# @param 1 Cask name
install_or_update_brew_cask() {
  install_or_update brew_cask "$1" "$1" "brew cask install $1" "brew_cask_upgrade $1"
}
