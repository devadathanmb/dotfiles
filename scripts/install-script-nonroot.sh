# Install kitty
echo "Installing kitty terminal"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Flatpak installs
clear
echo "Installing flatpaks"
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install telegram
flatpak install -y org.telegram.desktop

# Install postman
flatpak install -y com.getpostman.Postman

# Install Login Manager Settings
flatpak install -y io.github.realmazharhusain.GdmSettings

# Node js installation
clear
echo "Nodejs setup"

  # Install and run nvm
  curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o ${download_path}/install_nvm.sh
  bash ${download_path}/install_nvm.sh

  # Export nvm
  export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Source nvm
  source ~/.bash_profile

  # Test if nvm is installed
  command -v nvm

  # Install nodejs
  nvm install --lts
  