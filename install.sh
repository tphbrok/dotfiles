#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

echo "-> Ensuring Homebrew installation"
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "-> Installing Homebrew packages"
brew bundle --file="$DOTFILES/Brewfile"

echo "-> Creating symlinks in $HOME"
INCLUDE=(
  .zshrc
)
for name in "${INCLUDE[@]}"; do
  echo "$DOTFILES/$name -> $HOME/$name"
  ln -sfn "$DOTFILES/$name" "$HOME/$name"
done

echo "-> Done, reload your shell"
