#!/usr/bin/env sh

# Shells configuration
# ====================

# Source all files in lib and profile.d directories
for dir in lib profile.d
do
  find "$HOME/.dotfiles/$dir" -type f -not -name '.*' -not -name '*.example' | sort | while read -r filepath
  do
    # start_time=$(($(gdate +%s%N)/1000000))
    # shellcheck disable=SC1090
    . "$filepath"
    # end_time=$(($(gdate +%s%N)/1000000))
    # echo "Sourced $filepath in $(expr $end_time - $start_time) ms"
  done
done

# Add ~/.dotfiles/bin to path
prepend_to_path "${HOME}/.dotfiles/bin"
