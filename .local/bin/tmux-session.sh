#!/usr/bin/env bash

# Define the directories to search for projects and worktrees
BASE_DIRS=(~/Ideas ~/Contribs ~/Projects)

# Collect all directories and workspaces within worktrees
PROJECTS=$(find "${BASE_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d)

for dir in $REGULAR_DIRS; do
    PROJECTS+="$dir"$'\n'
done

# Use fzf for selection if no argument is passed
if [[ $# -eq 1 ]]; then
    SELECTED=$1
else
    SELECTED=$(echo "$PROJECTS" | sort -u | fzf --tmux center)
fi

# Exit if no selection was made
if [[ -z $SELECTED ]]; then
    exit 0
fi

SELECTED_NAME=$(basename "$SELECTED" | tr . _)

# Check if a tmux session exists, create one if it doesn't
if ! tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
    tmux new-session -ds $SELECTED_NAME -c $SELECTED
fi

# Switch to the selected tmux session
tmux switch-client -t $SELECTED_NAME
