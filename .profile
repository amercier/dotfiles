# Shells configuration
# ====================

# Check if a string contains agiven substring
# @param 1 String to check in
# @param 2 Substring to look for
# @param 3 Delimiter. Defaults to `[:space:]` (see `man tr`)
str_contains() {
  echo "$1" | tr -s "${3-[:space:]}" '\n' | egrep "^$2\$" >/dev/null
}

# Prepend a given path to the `PATH` environment variable
# @param 1 New path to add
prepend_to_path() {
  if ! str_contains "$PATH" "$1" :
  then
    PATH="$1:$PATH"
  else
    echo "Warning: $1 is already in PATH" >&2
  fi
}

# Source all files in profile.d
find "$HOME/.profile.d" -maxdepth 1 -type f | while read filepath
do
  # shellcheck source=~
  . "$filepath"
done
