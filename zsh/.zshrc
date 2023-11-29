# No zsh theme
ZSH_THEME=""

# Use Neovim
export EDITOR="nvim"

# Plugins
plugins=(git extract z zsh-autosuggestions zsh-syntax-highlighting)
source ~/.oh-my-zsh/oh-my-zsh.sh

# Custom prompt
PROMPT="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~ %{$reset_color%}%# "

# Enable vi mode in terminal
bindkey -v

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
