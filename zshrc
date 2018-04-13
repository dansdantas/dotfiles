# -------------------------------------------------------------------
# Zsh configurations
# -------------------------------------------------------------------

# Auto cd on dir name
setopt auto_cd

# Auto complete menu
setopt menu_complete

# History file and size
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
alias history='fc -fl 1'

# History options missing interpretation - Command history configuration
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt hist_ignore_dups       # ignore duplication command history list
setopt share_history          # share command history data

# Completion
zstyle ":completion:*" show-ambiguity "$color[fg-red]"
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"

# -------------------------------------------------------------------
# General
# -------------------------------------------------------------------

export TERM=screen-256color 
export EDITOR=nvim
export DOTFILES_PATH="$HOME/.dotfiles"
export FZF_COMMAND=$([ -z "$TMUX" ] && echo "fzf" || echo "fzf-tmux")

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Debugging android images
export PATH="$HOME/.bootimg:$PATH"

# Android Studio
export ANDROID_HOME="$HOME/.android/sdk"
export PATH="$PATH:$HOME/.android/android-studio/bin"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Gradle
export GRADLE_HOME="$HOME/.gradle/gradle-4.4.1"
export PATH="$PATH:$GRADLE_HOME/bin"

# Java 
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export JRE_HOME="$JAVA_HOME/jre"
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export PATH JAVA_HOME
export CLASSPATH=$JAVA_HOME/lib/tools.jar
export CLASSPATH=.:$CLASSPATH
export PATH JAVA_HOME CLASSPATH

# Enable lazy load for nvm plugin
export NVM_LAZY_LOAD=true

# -------------------------------------------------------------------
# Exports
# -------------------------------------------------------------------

# Rbenv 
export RBENV_ROOT="$HOME/.rbenv"
eval "$(rbenv init -)"

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init -)"

# Antigen
export ANTIGEN_HOME="$HOME/.antigen"

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

# Space
alias df="df -H"
alias du="du -ch"
alias dus="du -sckx * | sort -nr"

# Dir lists
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias ls="ls --color=auto"
alias lh='ls -l .??*'
alias lhd='ls -ld .??*'
alias lh='ls -a | egrep "^\."'

# Update
alias update="_ apt-get update && _ apt-get upgrade && _ apt-get update && _ apt-get upgrade"
alias install="_ apt-get install"
alias search="_ apt-cache search"
alias purge="_ apt-get purge"

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
# Antigen
# -------------------------------------------------------------------

# Load library
source $ANTIGEN_HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load bundles
antigen bundles <<EOBUNDLES
  git
  rails
  heroku
  command-not-found
  vi-mode

  djui/alias-tips
  hlissner/zsh-autopair
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-completions
  lukechilds/zsh-nvm
EOBUNDLES

# Theme
antigen theme dracula/zsh
# antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
antigen apply

# -------------------------------------------------------------------
# After load plugins
# -------------------------------------------------------------------

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Binding keys
bindkey '^@' autosuggest-accept
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Configuration for highlight style
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# -------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------

function gphm {
  git push heroku ${1:-master}:master
}

function vmi {
  $EDITOR $(ls -td db/migrate/* | head -1)
}
