#! /bin/bash

# Run this script as root
if [ "$EUID" -ne 0 ]
then
    echo "Run as root"
    exit
fi

# Users home directory
USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)

# Creating a directory for downloads
download_path="${USER_HOME}/Downloads/install-script-downloads"
mkdir -p $download_path

# Update system repositories and upgrade them
apt update && apt upgrade -y

apt install firefox -y

apt install code -y

apt install git -y

apt install alacritty -y

apt install unzip -y

apt install curl -y

apt install htop bpytop -y

apt install neofetch -y

apt install vlc -y

apt install mpv -y

apt install gnome-tweaks -y

apt install timeshift -y

apt install zsh -y

apt install simplescreenrecorder -y

apt install bat -y

apt install cmatrix -y

apt install flatpak -y

apt install gparted -y

apt install virtualbox -y

apt install openjdk-18-jdk-headless -y

apt install ubuntu-restricted-extras -y

apt install tranmission -y

# Install vim
add-apt-repository ppa:jonathonf/vim -y
apt update
apt install vim -y

# Install neovim
add-apt-repository ppa:neovim-ppa/stable -y
apt update
apt install neovim -y

# Install appimagelauncher
add-apt-repository ppa:appimagelauncher-team/stable -y
apt update
apt install appimagelauncher -y

# Install brave browser
apt install apt-transport-https curl
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser 

# Spotify 
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update && apt-get install spotify-client

# Balena etcher
curl -1sLf \
   'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
   | sudo -E bash
apt-get update
apt-get install balena-etcher-electron

# Deb package installations
clear
echo "Installing deb packages.."

# Install chrome
wget -O "${download_path}/chrome.deb" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install "${download_path}/chrome.deb"

# Install discord
wget -O "${download_path}/discord.deb" "https://discord.com/api/download?platform=linux&format=deb"
apt install "${download_path}/discord.deb"

# Install onlyoffice
wget -O "${download_path}/onlyoffice-install.deb" https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
apt install "${download_path}/onlyoffice-install.deb"

# Remove the downloaded files
clear
echo "Removing downloaded files"
rm -v -rf ${download_path}

# Update repositories and upgrade them
apt update && apt upgrade -y

# Remove unwanted dependencies
apt autoremove -y
apt autoclean
