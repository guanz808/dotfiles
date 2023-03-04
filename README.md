# dotfiles

### To run the install and configuration on an Ubuntu container:
```
apt update && apt upgrade -y
apt install curl -y
curl -o ~/ubuntu_setup01.sh https://raw.githubusercontent.com/guanz808/dotfiles/main/ubuntu_setup01.sh
cd ~
chmod +x ubuntu_setup01.sh
./ubuntu_setup01.sh -y
```
