
# -------------------------------------------------------------------
# Man
# -------------------------------------------------------------------

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# -------------------------------------------------------------------
# After load plugins
# -------------------------------------------------------------------

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------

function gphm {
  git push heroku ${1:-master}:master
}

function vmi {
  $EDITOR $(ls -td db/migrate/* | head -1)
}

function dt {
  $EDITOR "$DOTFILES_PATH/$(ls $DOTFILES_PATH | $FZF_COMMAND)"
}

function toca {
  cd "$TOCANET_HOME/$(ls $TOCANET_HOME | $FZF_COMMAND)"
}

function gcof {
  git checkout $(git branch | fzf)
}

function lipsum {
  curl -s -H 'Content-Type: application/json' -X POST https://lipsum.com/feed/json | jq -r '.feed.lipsum' | xclip -selection c
}

function nvre {
  arr=($(nvr --serverlist))
  nvr --servername=${arr[1]} --remote "$1"
}
