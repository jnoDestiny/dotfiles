#!/bin/bash

# Install and preconfigure packages

# Essentials
sudo apt install git
sudo apt install python3
sudo apt install pip
pip install --upgrade pip
python3 -m pip install IPython
sudo apt install ipython3
sudo apt install python-is-python3
sudo apt install make
sudo apt install gcc
sudo apt install cmake

# Configuration essentials
sudo apt install zsh
sudo apt install fzf
sudo apt install fd-find
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
echo '''#Default programs
export EDITOR="nvim"

# Removing clutter from home dir
export ZDOTDIR="$HOME/.config/zsh"

source $HOME/.config/.zshenv

. "$HOME/.cargo/env"''' > ~/.zshenv
rm ~/.profile
ln -s ~/.zprofile ~/.profile
chsh -s $(which zsh)
mkdir -p ~/.cache/zsh
test -f ~/.cache/zsh/history || touch ~/.cache/zsh/history

# Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit
rm lazygit.tar.gz

# Nice-to-haves
sudo apt install net-tools
sudo apt install pylint
sudo apt install ncdu
pip install git-filter-repo
pip install autopep8
pip install ipdb

# UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Development/Research Related
sudo apt install gdb
pip install pwntools
git config --global core.pager 'less --mouse --wheel-lines=3'
# Uncomment if using WSL
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Uncomment if using Ubuntu without WSL
sudo snap install rustup

# TODO: - Take care of p10k and fzf configuration at /usr/share/doc/fzf/examples/key-bindings.zsh
#       - Look into Meson for installation of radare2
#       - Add a WSL flag to set appendWindowPath = false in /etc/wsl.conf and keybindings in tmux.conf and zshrc
#       - Add a flag for research-related stuff

# Installation cleanup
sudo apt autoremove

# Setup
cd ~/.config
git submodule init
git pull --recurse-submodules

exec zsh

# TODO: Call PackerSync in vim (use vimscript?) and then:
# cd ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim
# cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build

