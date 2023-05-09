#!/bin/sh

alias nvimrc='nvim ~/.config/nvim/'


# get fastest mirrors
alias fast-mirrors="sudo reflector -c India --verbose --sort rate -l 10 --save /etc/pacman.d/mirrorlist"
alias latest-mirrors="sudo reflector --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# For when keys break
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

# Use kitten to ssh if using kitty
if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

# Other aliases
# alias ls="lsd"
alias neofetch="neofetch --config none"
alias cat="bat"
alias tldr="tldr --theme base16"
alias ll="ls -l"
alias la="ls -a"
alias lsa="ls -la"
alias down="cd ~/Downloads/"
alias work="cd ~/Documents/"
alias hypr="nvim ~/.config/hypr"

# Function to open pdf files in zathura
function pdf(){
  zathura "$@" &;
  disown;
}

# Function to open pptx files in zaread
function ppt(){
  zaread "$@" &;
  disown;
}

# Function to post stuff to 0x0.st
function genlink(){
  # Check if any arguments are passed
  if [[ $# -eq 0 ]]
  then
    echo "Usage: genlink file"
  else
    curl -F "file=@$1" https://0x0.st
  fi
}

# Launch neovim 
function nv(){
  if [[ $# -eq 0 ]]
  then
    nvim $(pwd)
  else
    nvim $1
  fi
}

# Lazy git
alias lgit="lazygit"

# Fzf repos
function repos(){
  z $(find $HOME/repos -maxdepth 1 -type d | fzf)
}

# Notes
alias notes="cd $HOME/notes"
alias notesup="cd $HOME/notes && git add . && git commit -m \"Update notes\" && git push origin master"

# Dotfiles
alias dotdir="cd $HOME/dotfiles/"
alias vimdots="nvim $HOME/entevim/"

# Fzf dots
function dots(){
  nvim $(find $HOME/dotfiles -maxdepth 1 | fzf)
}

# Use pywal generated colors for cava 
if [[ -e ~/.cache/wal/cava ]]
then alias cava="cava -p ~/.cache/wal/cava"
fi
