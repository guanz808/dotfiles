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

# install neovim
apt install neovim -y

# Install neofetch
apt install -y neofetch

# Download neofetch config.conf file
mkdir -p ~/.config/neofetch
curl -o ~/.config/neofetch/config.conf https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/neofetch/config.conf

# Append neofetch to the end of .bashrc if it doesn't exist
# echo -e "\n" "# Run Neofetch"
#sed -zi '/neofetch/!s/$/\nneofetch/' ~/.bashrc

# Customize the command prompt. Append the value of $PROMT to .bashrc if it doesn't exist.
#PROMPT=export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;11m\]@\[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
# echo -e "\n" "# Customize the command prompt"
#grep -wq  "$(echo $PROMPT)" ~/.bashrc || echo -e "\n" $PROMPT>>~/.bashrc

# Kubectl autocomplete
sudo apt-get install bash-completion
# echo -e "\n" "# Kubectl autocomplete"
echo -e "\n" "source <(kubectl completion bash)" >> ~/.bashrc

# Install Neovim
cd ~
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors
curl -o init.vim https://raw.githubusercontent.com/guanz808/dotfiles/main/.config/nvim/init.vim
mv init.vim ~/.config/nvim
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

# Install Powerlevel10 fonts
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Download ZSH .zshrc config file
curl -o .zshrc https://raw.githubusercontent.com/guanz808/dotfiles/main/.zshrc

# Download Powerlevel10 .p10k.zsh config file
curl -o .p10k.zsh https://raw.githubusercontent.com/guanz808/dotfiles/main/.p10k.zsh

# Start ZSH
zsh

# Install Spaceship Theme in ZSH
# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# install Powerline Fonts
# apt install fonts-powerline -y
