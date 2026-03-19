# Dotfiles Agent Instructions

## General

- This is a personal macOS development environment
- Prefer simplicity and minimal dependencies over abstraction
- Every tool choice should have a clear reason — don't add things speculatively
- Performance is a priority, especially for neovim startup time

## Shell

- Use zsh autoloaded functions for anything that needs `cd` or shell state
- Scripts in `scripts/` or `tools/` run as subprocesses — they cannot affect the current shell
- One function per file in `.zsh/functions/`, no wrapper needed (autoload handles it)

## Neovim

- One plugin per file in `lua/plugins/`
- `vim.pack.add` must always be at the top level of the plugin file, never inside a callback — it needs to run at startup to install
- `require` and `setup` calls can be deferred into autocommands for lazy loading
- LSP is configured with `vim.lsp.config` + `vim.lsp.enable` (native neovim 0.11+ API, not lspconfig framework)
- `angularls` should only attach in Angular projects — always use `root_markers = { "angular.json", "nx.json" }`
- Keymaps that depend on a plugin being loaded should be set inside the relevant autocommand or after `require`
- LSP keymaps must be set inside a `LspAttach` autocommand so they are buffer-local

## install.sh

- Must be idempotent — safe to re-run at any time without side effects
- Use `ln -sfn` for symlinks (overwrites existing)
- Use `brew bundle` for packages (skips already installed)
- Use `|| true` to suppress expected errors (e.g. skhd already installed)
- Use `--restart-service` not `--start-service` for services (works whether running or not)

## Git worktrees

- New worktrees are always branched from `origin/main`, never from the current branch
- `workon` and `workoff` always resolve the main worktree first via `git-main-worktree`
- Worktree directories are named `../<repo>-<safe-branch>` where slashes in branch names become dashes

## Dependencies

- Homebrew for CLI tools and casks
- mise for runtime version management (replaces nvm)
- npm globals tracked in `npm-globals.txt`, synced via `install.sh`
- No global npm packages should be installed manually outside of `npm-globals.txt`
