#!/usr/bin/env zsh

mv ~/.cache/zsh/history ~/.cache/zsh/history_bad
strings ~/.cache/zsh/history_bad > ~/.cache/zsh/history
fc -R ~/.cache/zsh/history
rm ~/.cache/zsh/history_bad

