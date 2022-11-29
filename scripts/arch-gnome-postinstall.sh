#! /bin/bash

# Setting up mirror for faster downloads
pacman -S --noconfirm reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector -c India --verbose --sort rate -l 10 --save /etc/pacman.d/mirrorlist

# Install paru
clear
echo "Instlling paru"
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -siakepkg -si

# Install packages
clear
pacman -S --noconfirm firefox \
	btop \
    htop \
	neofetch \
	vlc \
	mpv \
	gnome-tweaks \
	gnome-themes-extra \
	transmission-gtk \
	zsh \
	simplescreenrecorder \
	bat \
	neovim \
	gparted \
	cmatrix \
	jdk-openjdk \
	flatpak \
	lsd \
	man \
	alacritty \
	kitty \
	libreoffice-fresh \
	obsidian \
	python-pip \
    grub-btrfs \
    wget \
    curl \
    ranger \
    gvim


# AUR installs
 paru --noconfirm -S ttf-indic-otf
 paru --noconfirm -S gnome-browser-connector 
 paru --noconfirm -S discord
 paru --noconfirm -S visual-studio-code-bin  
 paru --noconfirm -S google-chrome 
 paru --noconfirm -S brave-bin 
 paru --noconfirm -S telegram-desktop-bin 
 paru --noconfirm -S ventoy-bin 
# paru --noconfirm -S onlyoffice-bin
 paru --noconfirm -S auto-cpufreq
 paru --noconfirm -S timeshift 
 paru --noconfirm -S ttf-ms-fonts
# paru --noconfirm -S system76-power
# paru --noconfirm -s gnome-shell-extension-system76-power
