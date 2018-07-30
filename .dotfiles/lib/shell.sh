# shellcheck disable=SC2148

# Shell-related utility functions
# ===============================

# Prepend a given path to the `PATH` environment variable
#
# @param 1 New path to add
prepend_to_path() {
  if str_contains "$PATH" "$1" :
  then
    if [ "${2-}" = '-f' ]
    then
      PATH=$(echo "$PATH" | tr ':' '\n' | grep -E -v "^$1\$" | tr '\n' ':')
      PATH="$1:$PATH"
    else
      echo "$(yellow Warning:) $(cyan "$1") is already in $(cyan PATH)" >&2
    fi
  else
    PATH="$1:$PATH"
  fi
}

# Whether a command exists.
#
# @param 1 Command to check
# @returns `0` if the command was found using `which`, `1` otherwise
command_exists() {
  type -p "$1" >/dev/null
}
