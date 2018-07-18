# Language utility functions
# ==========================

# Check if a string contains agiven substring
#
# @param 1 String to check in
# @param 2 Substring to look for
# @param 3 Delimiter. Defaults to `[:space:]` (see `man tr`)
str_contains() {
  echo "$1" | tr -s "${3-[:space:]}" '\n' | grep -E "^$2\$" >/dev/null
}

# Decode a URL-encoded string
# @param stdin Text to decode
url_decode() {
  if [ "$#" = 0 ]
  then
    if command_exists ruby
    then
      ruby -e 'require "uri"; puts URI.unescape(ARGF.read)'
    elif command_exists python
    then
      python -c 'import urllib; import sys; sys.stdout.write(urllib.unquote(sys.stdin.read()));'
    else
      echo 'url_decode: ruby or python command not found' >&2
      return 1
    fi
  else
    echo "$@" | url_decode
  fi
}

# Trim empty lines
#
# @param stdin Text to trim
trim_empty_lines() {
  sed '/^[[:space:]]*$/d'
}

# Trim leading and trailing spaces
#
# @param stdin Text to trim
trim() {
  sed 's/^[[:space:]]*//; s/[[:space:]]*$//'
}

# Escape a SED regular expression
sed_escape() {
  if [ "$#" = 0 ]
  then
    sed 's/\//\\\//g'
  else
    echo "$@" | sed_escape
  fi
}
