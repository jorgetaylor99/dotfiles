ZSH_THEME=""

plugins=(git zsh-autosuggestions zsh-syntax-highlighting extract z)

source ~/.oh-my-zsh/oh-my-zsh.sh

PROMPT="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~ %{$reset_color%}%# "

bindkey -v
