#!/bin/bash
cd ~
apt update && apt upgrade -y
apt install wget jq curl unzip gnupg software-properties-common git -y 

# Clone Dotfiles repository
git clone https://github.com/guanz808/dotfiles.git

# Azure CLI 
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install Terraform
#apt-get update && apt-get install -y gnupg software-properties-common curl
#curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
#apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
#apt-get update && apt-get install terraform -y

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Install Git on Ubuntu 22.04
#apt-get update
#apt-get install -y git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# Verify the Git installation
git --version

# Install GitHub CLI 
type -p curl >/dev/null || apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y

# Install JetBrains Mono font (used by starship and neovim)  < FIX FONT LOCATION TO SAVE IN USER PROFILE >
#wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
#unzip Hack-v3.003-ttf.zip -d /usr/local/share/fonts -yellow -y 
#rm -rf Hack-v3.003-ttf.zip

### Remove the .config directory ###
rm -rf .config

# Move necessary files to home directory and remove unnecessary files
mv -f dotfiles/.gitconfig ~               # move .gitconfig file(s) from dotfiles to ~
mv -f dotfiles/.config ~                  # move .config folder from the dotfiles folder to ~
mv -f dotfiles/.zshenv ~                  # move the .zshenv from the dotfiles folder to ~
#  # delete the dotfiles folder

### Install neofetch ###
apt install -y neofetch

# Download neofetch config.conf file
# mkdir -p ~/.config/neofetch
# curl -o ~/.config/neofetch/config.conf https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/neofetch/config.conf

# Install neovim
# Create ~/.config/nvim folder
# mkdir -p ~/.config/nvim
# curl -o ~/.config/nvim/ https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/nvim/
apt-get install build-essential -y

# Download neovim
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz

# extract
tar xzvf nvim-linux64.tar.gz

# move the nvim-linux64 directory
mv ~/nvim-linux64 /opt/

# Create a symbolic link in /usr/local/bin
ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# Make the symlink executable
chmod +x /usr/local/bin/nvim

# Remove the nvim-linux64.tar.gz file
rm nvim-linux64.tar.gz

# Download neovim configuration files
#cd ~
#mkdir -p ~/.config/nvim
#mkdir -p ~/.config/nvim/colors
#curl -o ~/.config/nvim/init.vim https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/nvim/init.vim

# install vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install ZSH
apt install zsh -y
chsh -s $(which zsh)  # make zsh the default shell
# Install OMZ
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

### Install ZSH syntax highlighting and autosuggestions
# download the syntax-highlighter plugin to a custom plugin directory and install (non-existing command are highlighted in red)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR:-~/.config/zsh}/plugins/zsh-syntax-highlighting

# download the autosuggestions plugin to a custom plugin directory and install (auto completes words)
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZDOTDIR:-~/.config/zsh}/plugins/zsh-autosuggestions

# download the zsh-history-substring-search plugin to a custom plugin directory and install
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZDOTDIR:-~/.config/zsh}/plugins/zsh-history-substring-search

##  # Install necessary packages for starship
##  apt-get update &&  apt-get install curl -y

# Install Starship
wget https://starship.rs/install.sh -O starshipInstall.sh
chmod +x starshipInstall.sh
./starshipInstall.sh -y



##  # Add starship.toml configuration file
##  cd ~
##  mkdir -p ~/.config/starship
##  curl -o ~/.config/starship/starship.toml https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/starship/starship.toml
##  
##  # Download ZSH .zshrc config file
##  curl -o .zshrc https://raw.githubusercontent.com/guanz808/dotfiles/main/.zshrc

# Cleanup
rm -r dotfiles
rm -r ./nvim-linux64.deb
rm -r starshipInstall.sh
rm -r ubuntu_setup01.sh

# Start ZSH
zsh
