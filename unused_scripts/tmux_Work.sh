#!/bin/bash
#check if Work session is already up, if it is attach it
WORKSESSION=`tmux list-sessions | grep -o -E '^Work:' | sed 's/://g'`
echo $WORKSESSION
if [[ $WORKSESSION ]]; then
    tmux attach -t Work
    exit 0
fi
if [[ -d $1 ]]; then
    tmux new-session -s Work -c $1 -d
    tmux send-keys 'vim' C-m   
    tmux split-window -v -c $1
    tmux resize-pane -D 10     
    tmux split-window -h -c $1
    tmux rename-window Dev
    tmux select-pane -t 1
    tmux attach -t Work
else
    tmux new-session -s Work -d
    tmux send-keys 'vim' C-m   
    tmux split-window -v
    tmux resize-pane -D 10     
    tmux split-window -h
    tmux rename-window Dev
    tmux select-pane -t 1
    tmux attach -t Work
fi

