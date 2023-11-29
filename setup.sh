#!/bin/bash

echo "Set up started."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo "Installing Oh My Zsh..."
  (sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)") && echo "Oh My Zsh installed successfully."
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew
echo "Updating Homebrew"
brew update

# Install all our dependencies with bundle
echo "Installing dependencies from Brewfile..."
brew tap homebrew/bundle
brew bundle --file ./brew/Brewfile

# Ensure formulae are up-to-date
echo "Upgrading brew dependencies"
brew upgrade

# Create directory for neovim configuration if it doesn't exist
mkdir -p ~/.config/nvim

# Create symlinks
echo "Creating symlinks..."
ln -sf ~/.dotfiles/alacritty/.alacritty.yml ~/.alacritty.yml
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/macos/.hushlogin ~/.hushlogin

# Set macOS preferences - will run this last because it will reload the shell
echo "Setting macOS preferences..."
source ~/.dotfiles/macos/.macos

echo "Set up complete!"
