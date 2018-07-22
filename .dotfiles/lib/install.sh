# shellcheck disable=SC2148

# Installation-related utility function
# =====================================

# Install or update a command or an application
#
# @param 1 Type of what to install: command or application
# @param 2 Name of the application or command to check
# @param 3 Name of the application or command to display
# @param 4 Install command
# @param 5 Update command
install_or_update() {
  if ! eval "${1}_exists" \'"$2"\'
  then
    echo "$(blue ▶) installing $(cyan "$3")..."
    eval "$4" && echo "$(green ✓) Done" || echo "$(red ✗) Failed"
    echo
  elif [ -n "${5-}" ]
  then
    echo "$(blue ▲) $(cyan "$3") is already installed, updating..."
    eval "$5"
    echo "$(green ✓) $(cyan "$3") is up-to-date."
    echo
  else
    echo "$(green ✓) $(cyan "$3") is already installed, nothing to update."
  fi
}
