# dotfiles

### To run the install and configuration on an Ubuntu container:
```
apt update && apt upgrade -y
apt install curl git -y
curl -o ~/ubuntu_setup01.sh https://raw.githubusercontent.com/guanz808/dotfiles/main/ubuntu_setup01.sh
cd ~
chmod +x ubuntu_setup01.sh
./ubuntu_setup01.sh -y
```

alternative:
```
apt update && apt upgrade -y
apt install curl git -y
cd $pwd
git clone https://github.com/guanz808/dotfiles.git
chmod +x ~/dotfiles/ubuntu_setup01.sh
~/dotfiles/ubuntu_setup01.sh -y


```
