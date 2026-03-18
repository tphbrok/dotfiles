#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

# Symlink dot-directories/files into $HOME
for item in "$DOTFILES"/.[^.]*; do
  name=$(basename "$item")
  ln -sfn "$item" "$HOME/$name"
done

echo "Done, reload your shell"
