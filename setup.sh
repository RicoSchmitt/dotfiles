#!/bin/bash
set -e

# System basics
sudo timedatectl set-timezone Europe/Berlin
sudo localectl set-x11-keymap de
sudo sed -i 's/# de_DE.UTF-8/de_DE.UTF-8/' /etc/locale.gen
sudo locale-gen

# Docker repo
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install packages
sudo apt update
sudo apt install -y \
  sway foot waybar wofi wl-clipboard \
  vim git curl \
  freecad \
  docker-ce docker-ce-cli containerd.io docker-compose-plugin \
  console-data spice-vdagent

# Add user to docker group
sudo usermod -aG docker $USER

# Symlink configs
mkdir -p $HOME/.config/sway
ln -sf $HOME/dotfiles/sway/config $HOME/.config/sway/config

echo "Done. Log out and back in for docker group."
