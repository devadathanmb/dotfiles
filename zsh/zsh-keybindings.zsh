#! /bin/sh

# Key-bindings
bindkey -s '^o' 'ranger^M' # Ranger key binding
bindkey -s '^f' 'nvim $(fzf)^M' # Fuzzy finder keybinding
# bindkey -s '^v' 'nvim^M' # Neovim keybinding
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey "^a" beginning-of-line # Move to beginning of the line
bindkey "^e" end-of-line # Move to the end of the line
bindkey -r "^u"


# Fzf cd 
fzf-cd() {
  local dir="$(find $HOME -type d -print 2> /dev/null | fzf +m)"
  if [ -n "$dir" ]; then
    cd "$dir"
  fi
}

set -o ignoreeof
zle -N fzf-cd-widget
bindkey "^d" fzf-cd-widget

