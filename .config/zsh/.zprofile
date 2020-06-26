#!/bin/sh

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du "$HOME/.config/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="chromium"
export READER="zathura"
export FILE="vifm"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
