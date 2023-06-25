hypr_packages=(
    seatd
    orchis-theme-git
    nautilus
    adwaita-gtk
    qt5ct
    qt6ct
    cliphist
    qt4ct
    nwg-look
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
    rofi-lbonn-wayland-git
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
    waybar-hyprland-git
    swayidle
    swaylock-effects
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
    obsidian
    lazygit
    firefox
    ripgrep
    stylua
    python-pip
    unzip
    zip
    curl
    wget
    httpie
    libreoffice-fresh
    neovim
    vim
    tmux
    zathura
    zathura-pdf-mupdf
    system-config-printer
    network-manager-applet
    fzf
    visual-studio-code-bin
    # google-chrome
    brave-bin
    ngrok
    zsh
    docker
    man
    kitty
    foot
    jdk-openjdk
)

necessary_packages=(
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
    telegram-desktop-bin
    mpv
    yt-dlp
    timeshift
    ventoy-bin
    deluge
    deluge-gtk
    alacritty
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji
    indic-otf
    ttf-ms-fonts
)

other_packages=(
    cava
    cli-visualizer
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

# Setup groups
setup_groups(){
    usermod -aG cups,docker,seat,video,audio devadathan
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

# Setup backlight
setup_backlight(){
    if [[ ! -d "/etc/udev/rules.d/" ]]
    then
        sudo mkdir /etc/udev/rules.d
    fi
    sudo cp $HOME/dotfiles/backlight.rules /etc/udev/rules.d/backlight.rules
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
    clear
    paru --noconfirm
    paru --clean --noconfirm
    paru -Sc --noconfirm
    echo "Bootstrap complete. Please reboot the system."
    neofetch
}

main
