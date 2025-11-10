#!/usr/bin/sh

. $ZDOTDIR/env
. $ZDOTDIR/plug
. $ZDOTDIR/fzf
. $ZDOTDIR/keybinds
. $ZDOTDIR/options
. $ZDOTDIR/aliases
. $ZDOTDIR/completion
. $ZDOTDIR/custom
. $ZDOTDIR/shell

source_file_if_exists $ZDOTDIR/work

# it needs to be last imported because of fzf
eval "$(atuin init zsh)"

# Mise
eval "$(mise activate zsh)"
