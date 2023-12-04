#!/bin/zsh

echo "Set up started."

# Check for Zsh and Git, required for Oh My Zsh and plugins installation
if ! command -v zsh >/dev/null || ! command -v git >/dev/null; then
  echo "Error: Zsh and Git must be installed."
  exit 1
fi

# Install Oh My Zsh and Plugins
if ! command -v omz >/dev/null; then
  echo "Installing Oh My Zsh..."
  (sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)") && echo "Oh My Zsh installed successfully."
  
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Install Homebrew
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update and install dependencies with Homebrew
echo "Updating Homebrew..."
brew update
echo "Installing dependencies from Brewfile..."
brew tap homebrew/bundle
brew bundle --file ./brew/Brewfile
echo "Upgrading brew dependencies..."
brew upgrade

# Ensure the .dotfiles directory exists
if [ ! -d ~/.dotfiles ]; then
  echo "Error: ~/.dotfiles directory not found."
  exit 1
fi

# Create directory for neovim configuration if it doesn't exist and create symlinks
mkdir -p ~/.config/nvim
echo "Creating symlinks..."
ln -sf ~/.dotfiles/alacritty/.alacritty.yml ~/.alacritty.yml
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/macos/.hushlogin ~/.hushlogin

# Set macOS preferences
echo "Setting macOS preferences..."
source ~/.dotfiles/macos/.macos

echo "Set up complete!"
