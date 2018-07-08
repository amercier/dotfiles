#!/usr/bin/env sh

# Shells configuration
# ====================

# Source all files in profile.d
find "$HOME/.profile.d" -maxdepth 1 -type f -not -name '.*' -not -name '*.example' | sort | while read filepath
do
  # start_time=$(($(gdate +%s%N)/1000000))
  # shellcheck source=~
  . "$filepath"
  # end_time=$(($(gdate +%s%N)/1000000))
  # echo "Sourced $filepath in $(expr $end_time - $start_time) ms"
done
