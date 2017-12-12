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
  | while read p; do
    . "$p"
  done;
