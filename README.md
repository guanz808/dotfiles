# dotfiles

### To run the install and configuration on an Ubuntu container:
```
apt update && apt upgrade -y
apt install curl git -y
cd $pwd
curl -o ~/ubuntu_setup01.sh https://raw.githubusercontent.com/guanz808/dotfiles/main/ubuntu_setup01.sh
chmod +x ~/ubuntu_setup01.sh
~/ubuntu_setup01.sh -y
```
