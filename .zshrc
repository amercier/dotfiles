#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

# Fix for https://github.com/sorin-ionescu/prezto/issues/397
# See comment https://github.com/sorin-ionescu/prezto/issues/397#issuecomment-14138145
export LANG="en_US.UTF-8"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Single-line prompt
prompt_newline='%666v'
PROMPT=" $PROMPT"

# Pure arrows
PURE_GIT_UP_ARROW=↑
PURE_GIT_DOWN_ARROW=↓
