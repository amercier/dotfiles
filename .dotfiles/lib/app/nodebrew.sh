# shellcheck disable=SC2148

# nvm-related utility functions
# =============================

# Grep a NodeJS version on Nodebrew output
# @param 1 NodeJS main version number, without "v". Ex: "0.12", "4", "10"
nodebrew_grep_version() {
  grep -q -E "^v$1\\."
}

# Whether a NodeJS version is installed on Nodebrew
# @param 1 NodeJS main version number
nodebrew_node_version_exists() {
  nodebrew ls | nodebrew_grep_version "$1"
}

# Install or upgrade a NodeJS version on Nodebrew
#
# @param 1 Version or alias
install_or_update_nodebrew_node_version() {
  install_or_update nodebrew_node_version "$1" "Node.js $1" "nodebrew install $1" "nodebrew install $1"
}

# Whether a NodeJS version is installed on Nodebrew
# @param 1 NodeJS main version number
nodebrew_alias() {
  nodebrew alias "$1" | grep ' -> ' | grep -o -E '[^ ]*$'
}
