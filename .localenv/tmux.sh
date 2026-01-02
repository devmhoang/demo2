#!/bin/bash


if tmux has-session -t demo2 2>/dev/null; then
  tmux attach -t demo2

else
  tmux new -d -s demo2
  tmux send-keys -t demo2 "cd ~/REPO1/demo2/backend1" C-m
  tmux split-window -v -t demo2
  tmux send-keys -t demo2.1 "cd ~/REPO1/demo2/frontend1; flutter run"
  # tmux attach -t BLG1
  tmux ls
fi
