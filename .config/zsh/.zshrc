#!/usr/bin/sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

. $ZDOTDIR/env
. $ZDOTDIR/plug
. $ZDOTDIR/fzf
. $ZDOTDIR/keybinds
. $ZDOTDIR/options
. $ZDOTDIR/aliases
. $ZDOTDIR/completion
. $ZDOTDIR/custom

source_file_if_exists $ZDOTDIR/work

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.local/share/zsh/.p10k.zsh ]] || source ~/.local/share/zsh/.p10k.zsh
