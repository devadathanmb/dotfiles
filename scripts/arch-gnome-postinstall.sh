#! /bin/bash

# Setting up mirror for faster downloads
pacman -S --noconfirm reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector -c India --verbose --sort rate -l 10 --save /etc/pacman.d/mirrorlist

# Install yay
clear
echo "Instlling yay"
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install packages
clear
pacman -S --noconfirm firefox \
	btop \
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
	nodejs \
	lsd \
	man \
	alacritty \
	kitty \
	npm \
	libreoffice-still \
	obsidian \
	python-pip \
    grub-btrfs

# AUR installs
 yay --noconfirm -S ttf-indic-otf
 yay --noconfirm -S gnome-browser-connector 
 yay --noconfirm -S discord
 yay --noconfirm -S visual-studio-code-bin  
 yay --noconfirm -S google-chrome 
 yay --noconfirm -S brave-bin 
 yay --noconfirm -S telegram-desktop-bin 
 yay --noconfirm -S ventoy-bin 
 yay --noconfirm -S onlyoffice-bin
 yay --noconfirm -S auto-cpufreq
 yay --noconfirm -S timeshift 
# yay --noconfirm -S system76-power
# yay --noconfirm -s gnome-shell-extension-system76-power
