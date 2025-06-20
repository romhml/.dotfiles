#!/bin/sh

current_session=$(tmux display-message -p '#{session_name}')
if [ "$current_session" = '_notes' ]; then
    tmux switch-client -l
    exit 0
fi

if tmux has-session -t _notes 2>/dev/null; then
    tmux switch-client -t _notes
    exit 0
fi

tmux new-session -d -s _notes -c ~/.obsidian/Notes 'nvim'
tmux switch-client -t _notes
