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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.local/share/zsh/.p10k.zsh ]] || source ~/.local/share/zsh/.p10k.zsh
