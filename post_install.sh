#!/bin/sh
# This post install script works only for debian based, Gnome desktops.


## Download color themes for gnome-terminal
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"
bahs -c "$(curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -)"

## Updates
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade


## Installing deb packages
sudo apt install --upgrade curl git neovim tmux python3-virtualenv virtualbox virtualbox-ext-pack 


# Install brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install brave-browser

# steam
sudo apt install steam


## cappucin theme for tmux
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
touch ~/.config/tmux/tmux.conf
echo "run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux" >> ~/.config/tmux/tmux.conf
tmux source ~/.config/tmux/tmux.conf


## Notes
echo "For enabling Cappucin theme on gnome-terminal: Select from Edit -> Preferences."
echo "Google chrome is not installed; needs to be downloaded and installed."
echo "For GitHub SSH setup, refer: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"
