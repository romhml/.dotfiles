#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    SELECTED=$1
else
    SELECTED=$(find ~/Ideas ~/Sandbox ~/Contribs ~/Projects -mindepth 1 -maxdepth 1 -type d| fzfp --height 12 --width 70 --border none)
fi

if [[ -z $SELECTED ]]; then
    exit 0
fi

SELECTED_NAME=$(basename "$SELECTED" | tr . _)

if ! tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
    tmux new-session -ds $SELECTED_NAME -c $SELECTED
fi

tmux switch-client -t $SELECTED_NAME
