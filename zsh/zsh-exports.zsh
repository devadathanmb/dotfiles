#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# nvm, node, npm binary path
export PATH="$HOME/.nvm/versions/node/v20.11.0/bin/":$PATH

# Bat cat theme
export BAT_THEME="base16-256"

# # Flutter
# if [[ -e "/opt/flutter" ]]
# then
#     export PATH=$PATH:"/opt/flutter/bin"
# fi
#
# # Spicetify
# if [[ -e "$HOME/.spicetify/" ]]
# then
#     export PATH=$PATH:"$HOME/.spicetify/"
# fi
