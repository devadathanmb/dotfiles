#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# nvm, node, npm binary path
export PATH="$HOME/.nvm/versions/node/v20.12.0/bin/":$PATH

# Bat cat theme
export BAT_THEME="base16-256"
