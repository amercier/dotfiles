# Bash configuration

# Source shell-specific
shell=$(basename "$SHELL")
if [ -e "$HOME/.profile.d/$shell.shell.rc" ]; then
  . "$HOME/.profile.d/$shell.shell.rc"
fi

# Source all files in profile.d, except shell-specific configurations and aliases
while read f; do
  . "$f"
done < <(find "$HOME/.profile.d" -type f -name '*.rc' ! -name '*.shell.rc' ! -name '*.aliases.rc')

# Source all aliases files for which the command exists
while read f; do
  bin=$(basename "$f" .aliases.rc)
  if which "$bin" > /dev/null; then
    . "$f"
  else
    echo "Not loading aliases for $bin" >&2
  fi
done < <(find "$HOME/.profile.d" -type f -name '*.aliases.rc')
