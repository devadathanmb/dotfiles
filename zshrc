# ░▀▀█░█▀▀░█░█░█▀▄░█▀▀
# ░▄▀░░▀▀█░█▀█░█▀▄░█░░
# ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀

# My zshrc config

# Neofetch on start
neofetch

# p10k instant prompt - This should always stay on top of zshrc
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/.local/bin:/usr/local/bin:/.$PATH

# Path to your oh-my-zsh installation.
if [[ -e ~/.oh-my-zsh ]]
then
    export ZSH="$HOME/.oh-my-zsh"
fi

# Oh-my-zsh theme name
ZSH_THEME="powerlevel10k/powerlevel10k"


# Oh-my-zsh plugins
plugins=(git zsh-autosuggestions vi-mode zsh-syntax-highlighting)

# Load oh-my-zsh
if [[ -e ~/.oh-my-zsh ]]
then
    source $ZSH/oh-my-zsh.sh
fi


# User aliases
alias ls="lsd"
# alias cat="batcat"
alias cat="bat"
alias python="python3"
# alias lc="colorls"
alias work="cd /home/devadathan/Documents"
alias down="cd /home/devadathan/Downloads/"
alias conf="cd /home/devadathan/.config"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# alias dict="python3 ~/.local/bin/project.py -w"
alias tldr="tldr --theme base16"
alias dots="cd ~/.dotfiles"
alias s="kitty +kitten ssh" # Use ssh kitten to ssh into remote machines


# Disable auto title
DISABLE_AUTO_TITLE="true"


# Enable vim key bindings
bindkey -v

# Always use nvim as the editor
export EDITOR=nvim

# Flutter path
if [[ -e /opt/flutter/bin ]]
then
    export PATH=$PATH:/opt/flutter/bin
fi

# To customize prompt, run `p10k configure` or edit ~/dotfiles/p10k.zsh.
[[ ! -f ~/dotfiles/p10k.zsh ]] || source ~/dotfiles/p10k.zsh
