# No zsh theme
ZSH_THEME=""

# Plugins
plugins=(git extract z zsh-autosuggestions zsh-syntax-highlighting)
source ~/.oh-my-zsh/oh-my-zsh.sh

# Custom prompt
PROMPT="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~ %{$reset_color%}%# "

# Enable vi mode in terminal
bindkey -v
