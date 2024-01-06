#!/bin/sh

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du "$HOME/.config/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"

# Defaults
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
export READER="zathura"
export FILE="vifm"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export MACOS=true
  export XDG_RUNTIME_DIR=/tmp
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
