# No zsh theme
ZSH_THEME=""

# Use Neovim
export EDITOR="nvim"

# Plugins
plugins=(git extract z zsh-autosuggestions zsh-syntax-highlighting)
source ~/.oh-my-zsh/oh-my-zsh.sh

# Custom prompt
PROMPT="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[magenta]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%# "

# Enable vi mode in terminal
bindkey -v

# Put z compdump files in seperate directory as to avoid cluttering home
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# Automatically load all ssh keys from keychain after reboot
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
fi
ssh-add --apple-load-keychain &>/dev/null

# Load env variables to store gitconfig user credentials
source ../.env

# Aliases
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gb="git branch"
alias gco="git checkout"
alias h="history"
alias j="jobs -l"
alias nv="nvim"
alias python="python3"
