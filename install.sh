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
  .config/atuin
  .config/ghostty
  .config/mise
  .config/nvim
  .config/opencode
  .config/skhd
  .hushlogin
  .zshrc
)
for name in "${INCLUDE[@]}"; do
  rm -rf "$HOME/$name"
  echo "$DOTFILES/$name -> $HOME/$name"
  ln -sfn "$DOTFILES/$name" "$HOME/$name"
done

step "Starting skhd service"
skhd --install-service 2>/dev/null || true
skhd --start-service

step "Installing mise tools"
mise install

step "Syncing global npm packages"
xargs pnpm install -g < "$DOTFILES/npm-globals.txt"
installed=$(pnpm list -g --depth=0 --json | jq -r '.[0].dependencies | keys[]' | sort)
desired=$(grep -v '^\s*$' "$DOTFILES/npm-globals.txt" | sort)
to_remove=$(comm -23 <(echo "$installed") <(echo "$desired"))
[[ -n "$to_remove" ]] && echo "$to_remove" | xargs pnpm uninstall -g

echo "Done, reload your shell to finish"
