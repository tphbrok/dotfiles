alias brewsync="brew bundle --file=$HOME/dotfiles/Brewfile"
alias c=clear
alias npmsync="cat $HOME/dotfiles/npm-globals.txt | xargs npm install -g"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"
