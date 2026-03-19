#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

step() { echo "-> $*"; }

step "Ensuring Homebrew installation"
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

step "Installing Homebrew packages"
brew bundle --file="$DOTFILES/Brewfile"

step "Creating symlinks in $HOME"
INCLUDE=(
  .config
  .hushlogin
  .zshrc
)
for name in "${INCLUDE[@]}"; do
  echo "$DOTFILES/$name -> $HOME/$name"
  ln -sfn "$DOTFILES/$name" "$HOME/$name"
done

step "Starting skhd service"
skhd --install-service 2>/dev/null || true
skhd --start-service

step "Syncing global npm packages"
xargs npm install -g < "$DOTFILES/npm-globals.txt"
installed=$(npm list -g --depth=0 --parseable | xargs -I{} basename {} | sort)
desired=$(sort "$DOTFILES/npm-globals.txt")
to_remove=$(comm -23 <(echo "$installed") <(echo "$desired"))
[[ -n "$to_remove" ]] && echo "$to_remove" | xargs npm uninstall -g

echo "Done, reload your shell to finish"
