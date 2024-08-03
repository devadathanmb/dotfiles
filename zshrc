#!/bin/sh

# Load Zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/vim"
# plug "zap-zsh/zap-prompt"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-syntax-highlighting"
# plug "Freed-Wu/fzf-tab-source"
# plug "Aloxaf/fzf-tab"
# plug "zap-zsh/atmachine-prompt"
plug "Rishabh672003/zsh-autoswitch-virtualenv"
# plug "romkatv/powerlevel10k"
# plug "devadathanmb/arch-prompt"
plug "devadathanmb/zap-robbyrussell"

# Normal files to source
plug "$HOME/.config/zsh/zsh-exports.zsh"
plug "$HOME/.config/zsh/zsh-aliases.zsh"
plug "$HOME/.config/zsh/zsh-keybindings.zsh"


# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="foot"
export BROWSER="floorp"

export AUTOSWITCH_PIPINSTALL="FULL"

eval "$(zoxide init zsh)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
