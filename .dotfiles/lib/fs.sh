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
  if [ -e "$fullpath" ]
  then
    echo $(green ✓) File $(magenta $filename) already exists in $(cyan $1).
  else
    echo $(blue ▼) Downloading $(magenta $2) to $(cyan $1)...
    echo curl -# -L "$2" > "$fullpath"
    echo $(green ✓) Done.
    echo
  fi
}
