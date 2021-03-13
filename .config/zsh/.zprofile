#!/bin/sh

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du "$HOME/.config/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"

# Defaults
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="chromium"
export READER="zathura"
export FILE="vifm"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"

# Rust
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# Golang
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export PATH="$PATH:$GOPATH/bin"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
