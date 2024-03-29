hypr_packages=(
    seatd
    wev
    nemo
    adwaita-gtk
    papirus-icon-theme
    bibata-cursor-theme
    qt5ct
    qt6ct
    cliphist
    qt4ct
    wl-clipboard
    dunst
    light
    wireplumber
    pipewire
    pipewire-alsa
    pipewire-jack
    pipewire-pulse
    pipewire-pulse
    pipewire-audio
    pamixer
    qt5-wayland
    qt6-wayland
    waybar-mpris-git
    mpv-mpris-git
    wlogout
    swaybg
    swayimg
    nwg-look-bin
    vimiv
    rofi-lbonn-wayland
    rofi-emoji
    rofi-calc
    hyprpicker
    gnome-themes-extra
    adwaita-qt5
    adwaita-qt6
    wf-recorder
    pavucontrol
    nm-applet
    grimblast
    polkit-kde-agent
    udisks2
    udiskie
    hyprland
    xdg-desktop-portal-hyprland
    waybar
    swayidle
    hyprlock
)

devel_packages=(
    beautysh
    qrencode
    ranger
    socat
    inotify-tools
    exa
    bat
    lf-sixel-git
    chafa
    rsync
    zoxide
    go
    luals
    lazygit
    floorp-bin
    ripgrep
    fd
    stylua
    python-pip
    unzip
    zip
    curl
    wget
    httpie
    libreoffice-fresh
    neovim
    tmux
    zathura
    zathura-pdf-mupdf
    zaread
    system-config-printer
    network-manager-applet
    fzf
    google-chrome
    brave-bin
    zsh
    docker
    docker-compose
    man
    man-pages
    kitty
    foot
    jdk-openjdk
    python-virtualenv
    python-neovim
    python-black
    dnsutils
)

necessary_packages=(
    qrc
    acpi
    bluez
    bluez-utils
    playerctl
    ffmpeg
    obs-studio
    mtpfs
    jmtpfs
    gvfs-mtp
    gvfs-gphoto2
    downgrade
    calcure
    bat-asus-battery-bin
    epson-inkjet-printer-escpr
    epson-inkjet-printer-escpr2
    htop
    btop
    telegram-desktop
    webcord-bin
    mpv
    yt-dlp
    timeshift
    ventoy-bin
    deluge
    deluge-gtk
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji
    indic-otf
    ttf-ms-fonts
)

other_packages=(
    cava
    neofetch
    cowsay
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
        sudo pacman -S --noconfirm --needed base-devel
        git clone https://aur.archlinux.org/paru-bin.git $HOME/paru-bin
        cd ~/paru-bin
        makepkg -si --noconfirm
        cd ..
        rm -rf ~/paru-bin
    fi
}

install_packages(){
    clear
    if ! command -v paru &> /dev/null
    then
        install_paru
    fi

    clear
    for package in ${hypr_packages[@]}; do
        paru -S --noconfirm $package
    done

    clear
    for package in ${devel_packages[@]}; do
        paru -S --noconfirm $package
    done

    clear
    for package in ${necessary_packages[@]}; do
        paru -S --noconfirm $package
    done

    clear
    for package in ${other_packages[@]}; do
        paru -S --noconfirm $package
    done
}

# System level configs
config_system(){

    # Setup groups
    sudo usermod -aG cups,docker,seat,video,audio devadathan

    # Backlight
    if [[ ! -d "/etc/udev/rules.d/" ]]
    then
        sudo mkdir /etc/udev/rules.d
    fi
    sudo cp $HOME/dotfiles/backlight.rules /etc/udev/rules.d/backlight.rules
    sudo cp $HOME/dotfiles/power.rules /etc/udev/rules.d/power.rules
}

# Setup fonts
install_fonts(){
    mkdir -p ~/.local/share/fonts
    cp ~/dotfiles/fonts/* ~/.local/share/fonts
    fc-cache -fv
}

# Setup zap zsh
setup_zap(){
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
}

# Tmux plugin manger
setup_tmux(){
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

# Setup scripts
setup_scripts(){
    ln -s ~/dotfiles/scripts/general/* ~/.local/bin/
}

# Main
main(){
    clear
    update_mirrors
    install_packages
    install_fonts
    setup_zap
    setup_tmux
    setup_scripts
    config_system
    clear
    paru --noconfirm
    paru --clean --noconfirm
    paru -Sc --noconfirm
    echo "Bootstrap complete. Please reboot the system."
    neofetch
}

main
