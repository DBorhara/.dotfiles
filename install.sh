#!/usr/bin/env bash
# Set up these dotfiles on a Mac. Safe to run again: existing links are
# left alone, and real files/folders in the way are moved to *.backup.
#
#   git clone --recurse-submodules git@github.com:DBorhara/.dotfiles.git ~/Documents/dotfiles
#   ~/Documents/dotfiles/install.sh            # links + plugins
#   ~/Documents/dotfiles/install.sh --brew     # also install everything in Brewfile
set -euo pipefail

DOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

say() { printf '\033[1;35m==>\033[0m %s\n' "$*"; }

link() { # link <target in repo> <link path>
  local src="$DOT/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -L "$dst" && "$(realpath "$dst" 2>/dev/null)" == "$(realpath "$src")" ]]; then
    echo "   ok      $dst"
    return
  fi
  if [[ -e "$dst" || -L "$dst" ]]; then
    mv "$dst" "$dst.backup.$(date +%Y%m%d%H%M%S)"
    echo "   backup  $dst"
  fi
  ln -s "$src" "$dst"
  echo "   linked  $dst -> $src"
}

# 1. Homebrew packages (optional, slow)
if [[ "${1:-}" == "--brew" ]]; then
  if ! command -v brew >/dev/null; then
    say "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  say "Installing Brewfile"
  brew bundle --file="$DOT/Brewfile"
fi

# 2. Submodules (fzf-tab)
say "Updating submodules"
git -C "$DOT" submodule update --init --recursive

# 3. Symlinks
say "Linking configs"
link nvim              "$HOME/.config/nvim"
link kitty             "$HOME/.config/kitty"
link tmux              "$HOME/.config/tmux"
link eza               "$HOME/.config/eza"
link zsh               "$HOME/.config/zsh"
link neofetch          "$HOME/.config/neofetch"
link zsh/zshrc         "$HOME/.zshrc"
link tmux/tmux.conf    "$HOME/.tmux.conf"
link hammerspoon       "$HOME/.hammerspoon"
link git/gitconfig     "$HOME/.gitconfig"

# 4. Git identity (kept out of the repo)
if [[ ! -f "$HOME/.gitconfig.local" ]]; then
  say "Creating ~/.gitconfig.local"
  read -rp "   git user.name:  " name
  read -rp "   git user.email: " email
  printf '[user]\n\tname = %s\n\temail = %s\n' "$name" "$email" > "$HOME/.gitconfig.local"
fi

# 5. tmux plugins via TPM
TPM="$DOT/tmux/plugins/tpm"
if [[ ! -d "$TPM" ]]; then
  say "Installing TPM"
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM"
fi
say "Installing tmux plugins"
"$TPM/bin/install_plugins" >/dev/null || echo "   (open tmux and press prefix I if this failed)"

# 6. Neovim plugins (vim.pack installs on first start)
if command -v nvim >/dev/null; then
  say "Installing Neovim plugins"
  nvim --headless +q || true
fi

say "Done. Open a new terminal to pick everything up."
