#!/usr/bin/env sh
# shellcheck source=~

# ZSH configuration
# =================

add_to_path() {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";;
  esac
}

# Source all files in profile.d, except:
# - shell-specific configurations (*.rc)
# - utility scripts (*.sh)
# - hidden files (.*)
find "$HOME/.profile.d" \
    -type f \
    -maxdepth 1 \
    ! -name '*.rc' \
    ! -name '*.rc.local' \
    ! -name '*.sh' \
    ! -name '.*' \
  | while read p; do
    . "$p"
  done;

# Source shell-specific
shell=$(basename "$SHELL")
if [ -e "$HOME/.profile.d/$shell.rc" ]; then
  . "$HOME/.profile.d/$shell.rc"
fi
if [ -e "$HOME/.profile.d/$shell.rc.local" ]; then
  . "$HOME/.profile.d/$shell.rc.local"
fi
