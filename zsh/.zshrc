# Oh My Push Theme
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/atomic.omp.json)"

source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Go configuration
export GOPATH="$HOME/go"        
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

# Aliases
alias config="nvim ~/.zshrc"
alias reload="source ~/.zshrc && echo 'Reloaded zshrc'"

# Tmux
alias tmuxsf="$HOME/.config/tmux/scripts/tmux-sessionizer"
alias cht="$HOME/.config/tmux/scripts/tmux-cht.sh"

## Github
alias gs="git status"
alias ga="git add"
