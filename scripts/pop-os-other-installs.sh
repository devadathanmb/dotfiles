# _____                       _                               _       _   
#|  __ \                     | |                             (_)     | |  
#| |__) |__  _ __    ___  ___| |_ _   _ _ __    ___  ___ _ __ _ _ __ | |_ 
#|  ___/ _ \| '_ \  / __|/ _ \ __| | | | '_ \  / __|/ __| '__| | '_ \| __|
#| |  | (_) | |_) | \__ \  __/ |_| |_| | |_) | \__ \ (__| |  | | |_) | |_ 
#|_|   \___/| .__/  |___/\___|\__|\__,_| .__/  |___/\___|_|  |_| .__/ \__|
#           | |                        | |                     | |        
#           |_|                        |_|                     |_|        






# Install kitty
echo "Installing kitty terminal"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Flatpak installs
clear
echo "Installing flatpaks"
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y org.telegram.desktop

flatpak install -y com.getpostman.Postman

flatpak install -y io.github.realmazharhusain.GdmSettings

flatpak install -y flathub io.github.mimbrero.WhatsAppDesktop

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
  
