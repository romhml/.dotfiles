#!/bin/zsh
SELECTED=$(yadm list -a | fzfp --height 12 --width 70)

if [[ -z $SELECTED ]]; then
    exit 0
fi

tmux kill-window -t 'dot' &> /dev/null || true
tmux new-window -n 'dot' -c ~/${SELECTED%/*} nvim ~/$SELECTED
