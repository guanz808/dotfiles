#!/bin/bash
cd ~
apt update && apt upgrade -y
apt install wget jq curl unzip gnupg software-properties-common git -y 

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install Terraform
apt-get update && apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install terraform -y

# Install Git on Ubuntu 22.04
apt-get update
apt-get install -y git

# Verify the Git installation
git --version

# Install GitHub CLI
type -p curl >/dev/null || apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y

# Install JetBrains Mono font (used by starship and neovim)
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip -d /usr/local/share/fonts -yellow -y 
rm -rf Hack-v3.003-ttf.zip

# Install neofetch
apt install -y neofetch

# Download neofetch config.conf file
mkdir -p ~/.config/neofetch
curl -o ~/.config/neofetch/config.conf https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/neofetch/config.conf

# install neovim
apt install neovim -y

# Download neovim
curl -LO https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb

# Create ~/.config/nvim folder
mkdir -p ~/.config/nvim

# install neovim and cleanup
apt install ./nvim-linux64.deb
rm -rf ./nvim-linux64.deb

# Download neovim configuration files
cd ~
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors
curl -o ~/.config/nvim/init.vim https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/nvim/init.vim

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install ZSH
apt install zsh -y
chsh -s $(which zsh)  # make zsh the default shell
# Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install OMZ syntax highlighting and autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install necessary packages for starship
apt-get update &&  apt-get install curl -y

# Install Starship
wget https://starship.rs/install.sh -O starshipInstall.sh
chmod +x starshipInstall.sh
./starshipInstall.sh -y
rm -rf starshipInstall.sh

# Add starship.toml configuration file
cd ~
mkdir -p ~/.config/starship
curl -o ~/.config/starship/starship.toml https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/starship/starship.toml

# Download ZSH .zshrc config file
curl -o .zshrc https://raw.githubusercontent.com/guanz808/dotfiles/main/.zshrc

# Start ZSH
zsh
