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

# Put z compdump files in seperate directory as to avoid cluttering home
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# pyenv for managing python versions
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

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
