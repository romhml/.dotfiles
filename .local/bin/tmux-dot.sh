#!/bin/zsh

SELECTED=$(yadm list -a | fzf --tmux center)

if [[ -z $SELECTED ]]; then
    exit 0
fi

tmux kill-session -t '_dot' &> /dev/null || true
tmux new-session -d -s '_dot' -c ~/${SELECTED%/*} "nvim ~/$SELECTED;"
tmux switch-client -t '_dot'
