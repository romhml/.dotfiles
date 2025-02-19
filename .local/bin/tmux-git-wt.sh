# Add worktree check
if [ $(git rev-parse --is-inside-work-tree) = 'false' ] && [ $(git rev-parse --is-bare-repository) = 'false' ]; then
    exit 0
fi

SELECTED=$(git branch --format='%(refname:short)' | fzf --tmux center)

# Exit if no selection was made
if [[ -z $SELECTED ]]; then
    exit 0
fi

WORKTREE=$SELECTED
WORKTREE_PATH=$(git worktree list | grep "$SELECTED" -m 1 | cut -d' ' -f1)
WORKTREE_ROOT=$(git worktree list | grep "(bare)" -m 1 | cut -d' ' -f1)
REPOSITORY=$(basename "${WORKTREE_ROOT}")

if [[ -z $WORKTREE_PATH ]]; then
  WORKTREE_PATH=$WORKTREE_ROOT/$SELECTED
  git worktree add --guess-remote $WORKTREE_PATH $SELECTED
fi

SELECTED_NAME=$(echo "${REPOSITORY}@${WORKTREE}" | tr . _)

# Check if a tmux session exists, create one if it doesn't
if ! tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
    tmux new-session -ds $SELECTED_NAME -c $WORKTREE_PATH
fi

# Switch to the selected tmux session
tmux switch-client -t $SELECTED_NAME
