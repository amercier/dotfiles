# Filesystem-related utility functions
# ====================================

# Whether a directory exists
#
# @param 1 Directory to check
# @returns `0` if the directory exists, `1` otherwise
directory_exists() {
  [ -d "$1" ]
}

# File name from an URL
#
# @param stdin URLs
# @param 1 Replacement string. Defaults to '-'
url_to_filename() {
  replacement="${1--}"
  while read line
  do
    echo "$line" \
    | egrep -o '[^/]+$' \
    | egrep -o '^[^?#]+' \
    | url_decode \
    | sed "s/[<>:\"/\\|?*]/$replacement/g"
  done
}

# Download a file in a directory if it doesn't exists already.
#
# @param 1 Destination directory
# @param 2 Download URL
# @param 3 Filename. Inferred from URL by default.
download_file() {
  if [ -n "${3-}" ]
  then
    filename="$3"
  else
    filename=$(echo "$2" | url_to_filename)
  fi
  fullpath="$1/$filename"
  relative_path=$(readlink -f "$1" | sed "s/$(sed_escape "$HOME")/~/" | sed "s/$(sed_escape "$(pwd)")/./")
  if [ -e "$fullpath" ]
  then
    echo "$(green ✓) File $(cyan $filename) already exists in $(cyan $relative_path)."
  else
    echo "$(blue ▼) Downloading $(cyan $2) to $(cyan $relative_path)..."
    echo curl -# -L "$2" > "$fullpath"
    echo "$(green ✓) Done."
    echo
  fi
}

# Create a directory if it does not exist.
#
# @param 1 Direactory path.
create_directory_if_not_exists() {
  if directory_exists "$1"
  then
    echo "$(green ✓) $(cyan $1) directory already exists"
  else
    echo "$(blue ▶) Creating $(cyan $1) directory..."
    mkdir -p "$1"
    echo "$(green ✓) Done"
    echo
  fi
}
