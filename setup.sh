#!/bin/bash

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo "Installing Oh My Zsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
echo "Updating Homebrew recipes..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing dependencies from Brewfile..."
brew tap homebrew/bundle
brew bundle --file ./brew/Brewfile

# Create symlinks
echo "Creating symlinks..."
ln -sf ~/.dotfiles/alacritty/.alacritty.yml ~/.alacritty.yml
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.hushlogin ~/.hushlogin

# Set macOS preferences - will run this last because it will reload the shell
echo "Setting macOS preferences..."
source ./.macos

echo "Mac setup is complete!"
