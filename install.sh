#!/bin/bash
set -e

# Install packages
sudo dpkg --set-selections < packages.list
sudo apt-get dselect-upgrade -y

# Symlink configs
mkdir -p $HOME/.config/sway
ln -sf $HOME/dotfiles/sway/config $HOME/.config/sway/config

echo "Done."
