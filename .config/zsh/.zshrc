#!/usr/bin/sh

. $ZDOTDIR/env
. $ZDOTDIR/plug
. $ZDOTDIR/fzf
. $ZDOTDIR/keybinds
. $ZDOTDIR/options
. $ZDOTDIR/aliases
. $ZDOTDIR/completion
. $ZDOTDIR/custom

source_file_if_exists $ZDOTDIR/work

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/config.toml)"
fi
