#!/bin/bash

# Install and preconfigure packages

# Essentials
sudo apt install git
sudo apt install python3
sudo apt install pip
python3 -m pip install IPython

# Configuration essentials
sudo apt install zsh
sudo apt install fzf
sudo apt install exa
sudo apt install ncdu
sudo apt install libfuse2
sudo apt install tmux && sudo ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
sudo apt install bat
sudo apt install ripgrep

# ZSH
echo '''# Profile file. Runs on login. Environment variables are set here.

# Default programs
export EDITOR="nvim"

# Removing clutter from home dir
export ZDOTDIR="$HOME/.config/zsh"

. "$HOME/.cargo/env"''' > ~/.zprofile
ln -s ~/.zprofile ~/.profile
chsh -s $(which zsh)

# Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim

# Nice-to-haves
sudo apt install net-tools
sudo apt install pylint
sudo apt install ncdu
pip install git-filter-repo
pip install autopep8
pip install ipdb

# Development/Research Related
sudo apt install gdb
pip install pwntools
sudo snap install rustup

# TODO: - Take care of p10k and fzf configuration at /usr/share/doc/fzf/examples/key-bindings.zsh
#       - Look into Meson for installation of radare2
#       - Add a WSL flag to set appendWindowPath = false in /etc/wsl.conf
#       - Add a CTF flag

# Installation cleanup
sudo apt autoremove

# Setup
cd ~/.config
git submodule init
git pull --recurse-submodules

exec zsh

