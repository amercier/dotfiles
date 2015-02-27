# Bash configuration

. "$HOME/.profile.d/.colors"

# Source shell-specific
shell=$(basename "$SHELL")
if [ -e "$HOME/.profile.d/$shell.rc" ]; then
  . "$HOME/.profile.d/$shell.rc"
fi

path_add() {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";;
  esac
}

# Source all files in profile.d, except:
# - shell-specific configurations (*.rc)
# - utility scripts (*.sh)
# - hidden files (.*)
while read path; do
  [ ! -x "$path" ] || continue
  . "$path"
done < <(find -L "$HOME/.profile.d" -maxdepth 1 -type f ! -name '*.rc' ! -name '*.sh' ! -name '.*')
