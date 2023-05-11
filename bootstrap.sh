hypr_packages=(
    orchis-theme-git
    adwaita-gtk
    hyprland
    qt5ct
    qt6ct
    cliphist
    qt4ct
    swayidle
    swaylock-effects
    nwg-look
    wl-clipboard
    xdg-desktop-portal-hyprland-git
    dunst
    light
    wireplumber
    pipewire
    pipewire-alsa
    pipewire-jack
    pipewire-pulse
    pipewire-pulse
    pipewire-audio
    qt5-wayland
    qt6-wayland
    waybar-hyprland-git
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
    nautilus
)

devel_packages=(
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
    google-chrome
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
    cmatrix
    cava
    cli-visualizer
    neofetch
    lsd
    cowsay
    pipes.sh
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
        makepkg -si
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

# Main
main(){
    clear
    update_mirrors
    install_packages
    install_fonts
    setup_zap
    clear
    paru --noconfirm
    paru --clean --noconfirm
    paru -Sc --noconfirm
    echo "Bootstrap complete. Please reboot the system."
    neofetch
}

main
