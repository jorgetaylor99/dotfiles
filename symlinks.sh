#!/bin/bash

# Navigating to the home directory
cd ~

# Creating symlinks
ln -sf ~/.dotfiles/alacritty/.alacritty.yml .alacritty.yml
ln -sf ~/.dotfiles/git/.gitconfig .gitconfig
ln -sf ~/.dotfiles/zsh/.zshrc .zshrc
ln -sf ~/.dotfiles/zsh/.zprofile .zprofile
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.hushlogin .hushlogin

echo "Symlinks created successfully."
