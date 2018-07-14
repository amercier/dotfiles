# Atom-related utility functions
# ==============================

# Whether an Atom Package is installed
#
# @param 1 Package name
# @returns `0` if the package is installed, `1` otherwise
atom_package_exists() {
  [ -d "$HOME/.atom/packages/$1" ]
}

# Install or upgrade a Brew command
#
# @param 1 Command name
install_or_update_atom_package() {
  install_or_update atom_package "$1" "$1" "apm install $1" "apm upgrade $1"
}
