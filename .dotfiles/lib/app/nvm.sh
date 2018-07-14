# nvm-related utility functions
# =============================

# Whether a NVM Node.js version is installed
#
# @param 1 Version or alias
# @returns `0` if the version is installed, `1` otherwise
nvm_node_version_exists() {
  if [ "$1" = '--lts' ]
  then
    directory_exists "$HOME/.nvm/versions/lts"
  else
    directory_exists "$HOME/.nvm/versions/$1"
  fi
}

# Install or upgrade a NVM Node.js Version
#
# @param 1 Version or alias
install_or_update_nvm_node_version() {
  install_or_update nvm_node_version "$1" "Node.js $1" "nvm install $1" "nvm install $1"
}
