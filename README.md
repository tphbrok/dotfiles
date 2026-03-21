# dotfiles (work in progress)

My dotfiles to bootstrap my development tools and workflow on macOS.

## Quickstart

```sh
git clone https://github.com/tphbrok/dotfiles ~/dotfiles && ~/dotfiles/install.sh
```

## Highlights

- `zsh` functions
  - 'ai local opencode' to start OpenCode and connect it to a Qwen model running locally in LM Studio
  - 'workon/workoff' to create a Git worktree next to the main repository folder, named after the target branch
- Neovim configuration with plugins, using the new native Neovim plugin manager (`vim.pack`, available in Neovim 0.12+)
