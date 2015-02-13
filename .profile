# Bash configuration

. "$HOME/.profile.d/colors"

# Source shell-specific
shell=$(basename "$SHELL")
if [ -e "$HOME/.profile.d/$shell.shell.rc" ]; then
  . "$HOME/.profile.d/$shell.shell.rc"
fi

path_add() {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";;
  esac
}

# Source all files in profile.d, except shell-specific configurations, binary-specific and aliases
while read path; do
  . "$path"
done < <(find "$HOME/.profile.d" -type f -name '*.rc' ! -name '*.bin.rc' ! -name '*.shell.rc' ! -name '*.aliases.rc')

# Source all binary-specific aliases
while read path; do
  bin=$(basename "$path" .bin.rc | egrep -o '[^\.]+$')
  if which "$bin" > /dev/null || [ "$(type -t "$bin")" == "function" ]; then
    . "$path"
  elif [ ! -e "$0" ]; then
    echo "$(blue Warning:) $(cyan "$bin") is not installed, not loading $(yellow "$(basename "$path")")"
  fi
done < <(find "$HOME/.profile.d" -type f -name '*.bin.rc')

# Source all aliases files for which the command exists
while read path; do
  bin=$(basename "$path" .aliases.rc)
  if which "$bin" > /dev/null; then
    . "$path"
  elif [ ! -e "$0" ]; then
    echo "$(blue Warning:) $(cyan "$bin") is not installed, not loading $(yellow "$(basename "$path")")"
  fi
done < <(find "$HOME/.profile.d" -type f -name '*.aliases.rc')

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
