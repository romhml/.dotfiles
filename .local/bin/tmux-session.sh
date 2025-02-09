#!/usr/bin/env bash

# Define the directories to search for projects and worktrees
BASE_DIRS=(~/Ideas ~/Sandbox ~/Contribs ~/Projects)

# Find regular directories in the base directories
REGULAR_DIRS=$(find "${BASE_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d)

# Find Git worktrees
WORKTREES=$(find "${BASE_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d -exec test -f {}/HEAD \; -print)

# Function to find subdirectories (workspaces) in a worktree
find_workspaces_in_worktrees() {
    local worktree=$1
    find "$worktree/worktrees" -mindepth 1 -maxdepth 1 -type d
}

# Collect all directories and workspaces within worktrees
ALL_PROJECTS=""
for dir in $REGULAR_DIRS; do
    ALL_PROJECTS+="$dir"$'\n'
done

# Include the workspaces within each worktree
for worktree in $WORKTREES; do
    WORKSPACES=$(find_workspaces_in_worktrees "$worktree")
    ALL_PROJECTS+="$WORKSPACES"$'\n'
done

# Use fzf for selection if no argument is passed
if [[ $# -eq 1 ]]; then
    SELECTED=$1
else
    SELECTED=$(echo "$ALL_PROJECTS" | sort -u | fzf --tmux center)
fi

# Exit if no selection was made
if [[ -z $SELECTED ]]; then
    exit 0
fi

if [[ "$SELECTED" =~ ^(.*)/worktrees/(.*) ]]; then
    FOLDER=$(dirname "$(dirname "$SELECTED")")
    REPOSITORY=$(basename "$FOLDER")
    SELECTED=$(dirname $(cat $SELECTED/gitdir))
    WORKTREE=$(basename $SELECTED)
    SELECTED_NAME=$(echo "${REPOSITORY}@${WORKTREE}" | tr . _)
elif [[ "$SELECTED" =~ ^(.*) ]]; then
    SELECTED_NAME=$(basename "$SELECTED" | tr . _)
fi

# Check if a tmux session exists, create one if it doesn't
if ! tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
    tmux new-session -ds $SELECTED_NAME -c $SELECTED
fi

# Switch to the selected tmux session
tmux switch-client -t $SELECTED_NAME
