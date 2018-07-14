# MacOS-related utility function
# ==============================

# Whether an application exists in `/Applications` or `$HOME/Applications`
#
# @param 1 Application name to check, without `.app`
# @returns `0` if the application directory exists, `1` otherwise
application_exists() {
  directory_exists "/Applications/$1.app" || directory_exists -d "$HOME/Applications/$1.app"
}

# Install App Store upgrades for an application
#
# @param 1 Name of the application
install_app_store_upgrades() {
  softwareupdate --list | grep "\* $1" | sed "s/^[^A-Z]*//" | while read update
  do
    echo "$(blue ▲) Installing App Store update: $update"
    softwareupdate --install --no-scan "$update" || return 1
  done || return 0
}

# Get ID of a Mac App Store application
#
# @param 1 Application name
mas_id() {
  mas search "$1" | tr ' ' '\n' | head -n 1
}

# Install or upgrade a Mac App Store application
#
# @param 1 Application name
install_or_update_mas_application() {
  install_or_update application "$1" "$1" "mas install $(mas_id $1)" "mas upgrade $(mas_id $1)"
}

# Set System Preference value.
#
# @param 1 Domain. Use `defaults domains | tr ', ' '\n'` to list domains
# @param 2 Variable name
# @param 3 Variable type: bool, ...
# @param 4 Value to set
macos_set_preference() {

  if [ "$(defaults read $1 $2 2>/dev/null)" = "$4" ]
  then
    echo "$(green ✓) System preference $(magenta $1 $2) already set to $(cyan $4)"
    return
  fi

  if [ "$3" != "bool" ]
  then
    value="$4"
  elif [ "$4" = "1" ]
  then
    value=true
  else
    value=false
  fi
  echo $(blue ▶) Setting system preference "$1" "$2" to "$value"
  if [ "$#" = 5 ] && [ -n "$5" ]
  then
    sudo defaults write "$1" "$2" "-$3" "$value"
  else
    defaults write "$1" "$2" "-$3" "$value"
  fi
  echo $(green ✓) Done
  echo
}
