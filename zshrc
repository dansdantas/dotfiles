
# -------------------------------------------------------------------
# Alias
# -------------------------------------------------------------------

alias fa="alias | $FZF_COMMAND"
alias sudo="nocorrect sudo"
alias _="sudo"
alias md='mkdir -p'
alias rd=rmdir
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias weather='curl wttr.in/campos_dos_goitacazes'
alias t='trizen'

# Space
alias df="df -H"
alias du="du -ch"
alias dus="du -sckx * | sort -nr"

# Dir lists
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias ls='ls --color=auto'
alias lh='ls -l .??*'
alias lhd='ls -ld .??*'
alias lh='ls -a | egrep "^\."'
alias ls=exa

# Update
alias update='t -Syu'
alias install='t -S'
alias search='t -Ss'
alias purge='t -Rns'
alias clean='purge $(t -Qtdq)'

# Zsh
alias sz="source ~/.zshrc"
alias zlt="/usr/bin/time zsh -i -c exit"

# Rails
alias s='spring'
alias srs='s rails s'
alias src='s rails c'
alias rddl='rake db:drop:all'
alias rre='rddl && rdc && rdm && rds'
alias rrf="rake routes | $FZF_COMMAND"

# Rbenv
alias rb='rbenv'
alias rbg='rb gemset'
alias rbr='rb rehash'

# Zplug
alias zu="zplug update"
alias zpc="zplug clean && zplug clear && sz"

# Git
alias glog="git log --graph --oneline --decorate --date-order --color --boundary"
eval "$(hub alias -s)"

# Nvim
alias nv='nvim'
alias pi="$EDITOR +PlugInstall"
alias pc="$EDITOR +PlugClean"
alias pu="$EDITOR +PlugUpdate"

# Tmux
alias tmux-kill-all="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# Gem
gi() { gem install $@; rbenv rehash; rehash }

# Heroku
alias hrc="heroku run bundle exec rails c"
alias hrdm="heroku run bundle exec rake db:migrate"
alias hrds="heroku run bundle exec rake db:seed"
alias hrdsl="heroku run bundle exec rake db:schema:load"
alias hl="heroku logs -t"

# Config shortcuts
alias zshrc="$EDITOR $HOME/.zshrc"
alias tmuxconf="$EDITOR $HOME/.tmux.conf"
alias nvimrc="$EDITOR $HOME/.config/nvim/init.vim"

# Projects
export PERSONAL_HOME="$HOME/Projects/personal"
export ALGORICH_HOME="$HOME/Projects/algorich"
export TOCANET_HOME="$HOME/Projects/tocanet"

# Personal
alias central="$PERSONAL_HOME/apps/centraldasatleticas"
alias better="$PERSONAL_HOME/apps/better-app"

# Algorich
alias npad="$ALGORICH_HOME/na-praia-admin"
alias npas="$ALGORICH_HOME/na-praia-app-seller"
alias npa="$ALGORICH_HOME/na-praia-app"
alias gal="$ALGORICH_HOME/galcorr"
alias sv="$ALGORICH_HOME/safeverse"
alias svt="$ALGORICH_HOME/safeverse-site"
alias delphos="$ALGORICH_HOME/delphos-map"
alias dental="$ALGORICH_HOME/dental-norte"
alias front="$ALGORICH_HOME/frontify"
alias compb="$ALGORICH_HOME/components-builder"
alias mil="$ALGORICH_HOME/milenio"
alias fb="$ALGORICH_HOME/fittibank"
alias fbs="$ALGORICH_HOME/fittibank-seguros"

# Tocanet
alias dn="$TOCANET_HOME/denisa"
alias osj="$TOCANET_HOME/osj"
alias credit="$TOCANET_HOME/credit-concession"

# Helper and apps
alias tog='toggl'
alias dot="cd $DOTFILES_PATH"
alias work="cd $PERSONAL_HOME"
alias strem="sh $HOME/.strem/Stremio.sh"
alias qute="$PERSONAL_HOME/installers/qutebrowser/.venv/bin/python3 -m qutebrowser \"$@\" --enable-webengine-inspector"
alias scon="$PERSONAL_HOME/installers/sconsify"

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
