hypr_packages=(
  hyprland
  wl-clipboard
  xdg-desktop-portal-hyprland-git
  dunst
  light
  wireplumber
  pipewire
  qt5-wayland
  qt6-wayland
  waybar-hyprland-git
  swaybg
  rofi-lbonn-wayland-git
  hyprpicker
  sddm
  lxappearance
  webcord
  pavucontrol
  nm-applet
  polkit-kde-agent
  udisk2
  udiske
  pcmanfm-qt
)

my_packages=(
    "firefox"
    "cmatrix"
    "mpv" 
    "cava"
    "cli-visualizer"
    "yt-dlp"
    "vlc" 
    "zsh" 
    "simplescreenrecorder"
    "man"
    "flameshot"
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
    "indic-otf"
    "visual-studio-code-bin"
    "google-chrome"
    "brave-bin"
    "telegram-desktop-bin"
    "ventoy-bin"
    "mirage" 
    "timeshift"
    "ttf-ms-fonts"
    "ngrok"
    "lxappearance"
)


update_mirrors (){
    pacman -S --noconfirm reflector
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
    sudo reflector -c India --verbose --sort rate -l 10 --save /etc/pacman.d/mirrorlist
}


install_paru (){
    if ! command -v paru &> /dev/null
    then
        clear
        sudo pacman -S --needed base-devel
        git clone https://aur.archlinux.org/paru-bin.git
        cd paru-bin
        makepkg -si
        cd ..
    fi
}

install_packages(){
    clear
    if ! command -v paru &> /dev/null
    then
        install_paru
    fi

    clear
    for package in ${my_packages[@]}; do
      paru -S --noconfirm $package
    done

    clear
    for package in ${hypr_packages[@]}; do
        paru -S --noconfirm $package
    done
 }

 # Main
 main(){
     clear
     update_mirrors
     install_packages
     clear
     echo "Bootstrap complete. Please reboot the system."
 }

 main
