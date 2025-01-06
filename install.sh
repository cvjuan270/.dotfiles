#!/bin/bash
set -e

# Define colors for output using tput for better compatibility
PINK=$(tput setaf 204)
PURPLE=$(tput setaf 141)
GREEN=$(tput setaf 114)
ORANGE=$(tput setaf 208)
BLUE=$(tput setaf 75)
YELLOW=$(tput setaf 221)
RED=$(tput setaf 196)
NC=$(tput sgr0) # No Color

# Gentleman.Dots logo with pink color
logo='
            __
(\,--------"()"--o Tom4t3
 (_    ___    /~"
  (_)_)  (_)_)
'
# Display logo and title
echo -e "${PINK}${logo}${NC}"
echo -e "${PURPLE}Welcome to T0m4t3 dotfiles!${NC}"
sudo -v

while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "------------------Actualizando Paquetes------------------------"
sudo apt install software-properties-common -y
#sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt upgrade

echo "-------------------Instalando Paquetes-------------------------"
sudo apt install htop tree -y
sudo apt install curl
sudo apt install git
sudo apt install vim -y
sudo apt install fish -y
sudo apt install ripgrep fd-find luarocks -y
sudo apt install npm -y
sudo npm install -g tree-sitter-cli
sudo apt install maven -y
echo "-------------------Instlando brave-browser---------------------"
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y

echo "-------------------Instalando nvim---------------------"
 curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo "export PATH="$PATH:/opt/nvim-linux64/bin"" >> ~/.bashrc
source ~/.bashrc

echo "-------------------Instalando lazyvim---------------------"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
echo "--------------------Instalando Accesorios--------------------"
sudo apt install screenkey -y
