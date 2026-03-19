local branch="$1"
if [[ -z "$branch" ]]; then
  echo "Usage: workon <branch> (e.g. workon feat/ABC-123/add-feature)"
  return 1
fi
local repo=$(basename "$(git rev-parse --show-toplevel)")
local safe_branch=$(echo "$branch" | tr '/' '-')
local worktree="../${repo}-${safe_branch}"
if [[ -d "$worktree" ]]; then
  echo "Worktree already exists, switching to it"
  cd "$worktree"
else
  git worktree add "$worktree" -b "$branch" && \
  cd "$worktree" && \
  [[ -f package.json ]] && npm install
fi
