#! /usr/bin/env bash

# Pacman packages to be installed

pacman_packages=(
    "firefox"
    "cmatrix"
    "mpv" 
    "yt-dlp"
    "vlc" 
    "zsh" 
    "simplescreenrecorder"
    "man"
    "transmission-gtk"
    "neofetch"
    "lsd"
    "bat"
    "kitty"
    "alacritty"
    "tldr"
    "neovim"
    "python-pip"
    "libreoffice-fresh"
    "wget"
    "curl"
    "tmux"
    "git"
    "unzip"
    "gvim"
    "ranger"
    "jdk-openjdk"
    "python-pywal"
    "zathura"
    "zathura-pdf-poppler"
    "system-config-printer"
    "network-manager-applet"
    "fzf"
    "noto-fonts"
    "noto-fonts-extra"
    "noto-fonts-emoji"
)

# AUR packages to be installed

aur_packages=(
    "indic-otf"
    "discord"
    "visual-studio-code-bin"
    "google-chrome"
    "brave-bin"
    "telegram-desktop-bin"
    "ventoy-bin"
    "mirage" # Minimal gui photo viewer
    "timeshift"
    "ttf-ms-fonts"
    "ngrok"
)

# Packages needed for i3-gaps setup

i3_setup_packages=(
    "i3"
    "picom-pijulius-git"
    "polybar"
    "rofi"
    "rofi-calc"
    "rofi-emoji"
    "betterlockscreen"
    "nitrogen"
    "dunst"
    "main"
    "nitrogen"
    "lxqt-policykit"
    "xclip"
    "playerctl"
    "xrandr"
    "nm-applet"
    "zscroll"
    "pavucontrol"
    "udisk2"
    "udiskie"
    "pcmanfm"
    "lxappearance"
    "autotiling"
    "maim"
	"flameshot"
)

update_mirrors (){
   # Setting up mirror for faster downloads
    pacman -S --noconfirm reflector
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
    sudo reflector -c India --verbose --sort rate -l 10 --save /etc/pacman.d/mirrorlist
}

# Install AUR helper paru

install_paru (){
    if ! command -v paru &> /dev/null
    then
        echo "Installing paru"
        sudo pacman -S --needed base-devel
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        cd ..
    fi
}

install_packages(){
    clear
    echo "Installing pacman packages"
    for package in ${pacman_packages[@]}; do
        sudo pacman -S --noconfirm $package
    done


    if ! command -v paru &> /dev/null
    then
        install_paru
    fi


    clear
    echo "Installing AUR packages"
    for package in ${aur_packages[@]}; do
        paru -S --noconfirm $package
    done

    clear
    echo "Installing i3-setup packages"
    for package in ${i3_setup_packages[@]}; do
        paru -S --noconfirm $package
    done

   
 }

 # Main
 main(){
     update_mirrors
     install_packages
 }

 main
