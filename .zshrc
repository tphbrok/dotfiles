alias brewsync="brew bundle --file=$HOME/dotfiles/Brewfile && brew bundle cleanup --file=$HOME/dotfiles/Brewfile --force"
alias c=clear
alias npmsync="cat $HOME/dotfiles/npm-globals.txt | xargs npm install -g"
alias lg=lazygit

# Autoload zsh functions
fpath=("$HOME/dotfiles/.zsh/functions" $fpath)
for f in "$HOME/dotfiles/.zsh/functions"/*; do
  autoload -Uz "${f:t}"
done

eval "$(mise activate zsh)"
