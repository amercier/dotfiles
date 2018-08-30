# shellcheck disable=SC2148

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
  elif [ "$1" = '0.10' ]
  then
    list_files "$HOME/.nvm/" "v$1.*" > /dev/null
  else
    list_files "$HOME/.nvm/versions/node" "v$1.*" > /dev/null
  fi
}

# Install or upgrade a NVM Node.js Version
#
# @param 1 Version or alias
install_or_update_nvm_node_version() {
  cmd="bash -c '. /usr/local/opt/nvm/nvm.sh && nvm install $1'"
  install_or_update nvm_node_version "$1" "Node.js $1" "$cmd" "$cmd"
}

# Display latest version for a given version
#
# @param 1 Major version number. Ex: 10
nvm_latest_version() {
  nvm_ls | grep "v$1." | tail -n 1
}

# Get the major version number for a given Node version
# Ex:
#   v0.12.8 => 0.12
#   v10.8.0 => 10
#
# @param 1 Node version
nvm_major_version() {
  if [ "$#" = 0 ]
  then
    sed 's/^v//;s/\.[^.]*$//;s/^\([1-9][0-9]*\).*$/\1/'
  else
    echo "$@" | nvm_major_version
  fi
}

# Whether a Node version is outdated
#
# @param 1 Node version
nvm_is_latest_version() {
  latest="$(nvm_latest_version "$(nvm_major_version "$1")")"
  [ "$latest" = "$1" ]
}

# List outdated versions
#
nvm_outdated_versions() {
  nvm_ls | while read -r v
  do
    nvm_is_latest_version "$v" || echo "$v"
  done
}
