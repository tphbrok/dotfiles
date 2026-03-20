PS1=' %~ $ '

alias brewsync="brew bundle --file=$HOME/dotfiles/Brewfile && brew bundle cleanup --file=$HOME/dotfiles/Brewfile --force"
alias c=clear
alias lg=lazygit
alias npmsync="cat $HOME/dotfiles/npm-globals.txt | xargs npm install -g"

# Autoload zsh functions
fpath=("$HOME/dotfiles/.zsh/functions" $fpath)
for f in "$HOME/dotfiles/.zsh/functions"/*; do
  autoload -Uz "${f:t}"
done

eval "$(mise activate zsh)"
eval "$(atuin init zsh --disable-up-arrow)"


# pnpm
export PNPM_HOME="/Users/tphbrok/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.lmstudio/bin:$PATH"
