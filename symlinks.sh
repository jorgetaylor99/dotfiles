#!/bin/bash

# Navigating to the home directory
cd ~

# Creating symlinks
ln -sf ~/.dotfiles/.alacritty.yml .alacritty.yml
ln -sf ~/.dotfiles/.gitconfig .gitconfig
ln -sf ~/.dotfiles/.zshrc .zshrc
ln -sf ~/.dotfiles/.zprofile .zprofile

echo "Symlinks created successfully."

