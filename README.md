# My dotfiles 🖤

I can't live without these files :)

These dotfiles are managed using [Dotbot](https://github.com/anishathalye/dotbot)

## Previews

![2023-04-21T19:16:48,362310256+05:30](https://user-images.githubusercontent.com/84301852/233652836-654a3c50-9304-4f6c-b9ab-28234a80017d.png)

<br>

![2023-04-21T19:14:54,983539899+05:30](https://user-images.githubusercontent.com/84301852/233652916-8d2f689d-4e1a-414e-b2a3-b706da6c5f09.png)

<br>

![2023-04-21T19:16:03,243653518+05:30](https://user-images.githubusercontent.com/84301852/233652860-fe4f56e2-cab6-4fb5-a47a-5f76e943b7d3.png)

<br>

## Stuff I use

- [Hyprland](https://hyprland.org/) - An awesome wl-roots based wayland compositor
- [Waybar](https://github.com/Alexays/Waybar) - Bar for wl-roots based wayland compositors
- [Kitty](https://sw.kovidgoyal.net/kitty/) - Terminal emulator
- [Foot](https://codeberg.org/dnkl/foot) - A minimal wayland native terminal emulator
- [Zsh](https://www.zsh.org/) - Shell
- [Zap Zsh](https://github.com/zap-zsh/zap) - Zsh plugin manager
- [Starship](https://starship.rs/) - Shell prompt
- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [Lbonn rofi](https://github.com/lbonn/rofi) - A fork of Rofi for wayland
- [Sway bg](https://github.com/swaywm/swaybg) - Wallpaper tool
- [Sway lock effects](https://github.com/mortie/swaylock-effects) - Lock screen
- [Wlogout](https://github.com/ArtsyMacaw/wlogout) - Logout menu
- [Vimiv](https://github.com/karlch/vimiv) - Image viewer
- [Mpv](https://github.com/mpv-player/mpv) - Video player
- [Dunst](https://github.com/dunst-project/dunst) - A light weight notification daemon
- [Zathura](https://github.com/pwmt/zathura) - Document viewer
- [Ranger](https://github.com/ranger/ranger) - TUI filemanager
- [Nautilus](https://gitlab.gnome.org/GNOME/nautilus) - GUI filemanager
- [Neovim](https://github.com/neovim/neovim) - Text editor
- [ly](https://github.com/fairyglade/ly) - A simple TUI display manager

## Hyprland Keybindings Cheatsheet

This cheatsheet contains all the keybindings that I use in my hyprland config. Many of these bindings are controlled using custom scripts available in `scripts/`

### General

- `SUPER + Enter` - Launch terminal
- `SUPER + T` - Launch terminal
- `SUPER + space` - Toggle between tiling and floating mode
- `SUPER + q` - Close active window
- `SUPER + [1-9]` - Move to nth workspace
- `SUPER + u` - Move to prev workspace
- `SUPER + i` - Move to next workspace
- `SUPER + SHIFT + u` - Move active window to prev workspace
- `SUPER + SHIFT + i` - Move active window to next workspace
- `SUPER + w` - Cycle to next wallpaper
- `SUPER + SHIFT + w` - Cycle to prev wallpaper
- `SUPER + ALT + w` - Set a random wallpaper
- `SUPER + SHIFT + g` - Toggle group (aka tabbed layout)
- `SUPER + TAB` - Cycle through active groups
- `SUPER + n` - Move to next free workspace
- `SUPER + SHIFT + n` - Move active window to next free workspace
- `SUPER + p` - Screenshot menu
- `SUPER + SHIFT + r` - Screen recording menu
- `SUPER + {h, j, k, l}` - Move window focus (Vim style) 
- `SUPER + SHIFT + {h, j, k, l}` - Move window (Vim style) 
- `SUPER + F` - Toggle fullscreen
- `SUPER + b` - Toggle waybar
- `SUPER + SHIFT + b` - Reload waybar
- `SUPER + o` - Rofi window menu
- `SUPER + d` - Rofi app menu
- `SUPER + e` - Rofi emoji
- `SUPER + c` - Rofi calc
- `SUPER + a` - Toggle animations
- `SUPER + SHIFT + c` - Colorpicker hyprpicker
- `SUPER + SHIFT + d` - Toggle borders
- `SUPER + SHIFT + a` - Toggle opacity and blur
- `CTRL + SUPER + u` - Decrease screen brightness
- `CTRL + SUPER + i` - Increase screen brightness
- `CTRL + SUPER + j` - Decrease volume
- `CTRL + SUPER + k` - Increase volume
- `SUPER + ALT + l` - Lock screen
- `CTRL + SUPER + h` - Move to first existing workspace
- `CTRL + SUPER + h` - Move to last existing workspace
- `SUPER + V` - Rofi clipboard 
- `SUPER + SHIFT + o` - Reorganize windows to lower workspaces

### Submaps

- All submaps are reset using `ESC`

- `SUPER + G` - Gaps submap
  - `t` - Toggle gaps 
  - `i` - Increase inner gaps 
  - `u` - Decrease inner gaps 
  - `k` - Increase outer gaps 
  - `j` - Decrease outer gaps 

<br> 

- `SUPER + M` - Music script submap
  - `m` - Rofi music menu
  - `i` - Increase volume 
  - `u` - Decrease volume
  - `k` - Pause
  - `s` - Stop music
  - `n` - Next track
  - `p` - Prev track


## Quick setup:

_These dotfiles are configured to work on my system, these may or may not work the same out of the box on your system. So make needed the changes. Checkout **bootstrap.sh** script for the required tools and packages._
<br>

1. Clone the repo:

```bash
git clone https://github.com/devadathanmb/dotfiles
```

2. Setup the symlinks:

```bash
cd dotfiles/
./install
```

---

_Find my neovim configs [here](https://github.com/devadathanmb/entevim)_
