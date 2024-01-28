
#!/bin/bash
cd ~
sudo apt update && apt upgrade -y
sudo apt install wget jq curl unzip gnupg software-properties-common git -y 

# Clone Dotfiles repository
git clone https://github.com/guanz808/dotfiles.git

# Azure CLI 
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform

# Install Git on Ubuntu 22.04
sudo apt-get install -y git

# Verify the Git installation
git --version

# Install GitHub CLI 
type -p curl >/dev/null || apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

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

### Install neofetch ###
sudo apt install -y neofetch

# Install neovim
# Download neovim
sudo apt-get install build-essential
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz

# extract
tar xzvf nvim-linux64.tar.gz

# move the nvim-linux64 directory
sudo mv ~/nvim-linux64 /opt/

# Create a symbolic link in /usr/local/bin
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# Make the symlink executable
sudo chmod +x /usr/local/bin/nvim

# Remove the nvim-linux64.tar.gz file
rm nvim-linux64.tar.gz

# Install ZSH
sudo apt install zsh -y
sudo chsh -s $(which zsh)  # make zsh the default shell
# Install OMZ
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

### Install ZSH syntax highlighting and autosuggestions
# download the syntax-highlighter plugin to a custom plugin directory and install (non-existing command are highlighted in red)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR:-~/.config/zsh}/plugins/zsh-syntax-highlighting

# download the autosuggestions plugin to a custom plugin directory and install (auto completes words)
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZDOTDIR:-~/.config/zsh}/plugins/zsh-autosuggestions

# download the zsh-history-substring-search plugin to a custom plugin directory and install
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZDOTDIR:-~/.config/zsh}/plugins/zsh-history-substring-search

# Install Starship
sudo wget https://starship.rs/install.sh -O starshipInstall.sh
sudo chmod +x starshipInstall.sh
./starshipInstall.sh -y

# Cleanup
sudo rm -r dotfiles
sudo rm -r ./nvim-linux64.deb
sudo rm -r starshipInstall.sh
sudo rm -r ubuntu_setup01.sh

# if you get the error "/bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)"
# run the following command
sudo apt install locales
sudo locale-gen en_US.UTF-8

# Start ZSH
zsh
