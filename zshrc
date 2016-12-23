# -------------------------------------------------------------------
# Zsh configurations
# -------------------------------------------------------------------

# Auto cd on dir name
setopt auto_cd

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

# Binding keys
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# -------------------------------------------------------------------
# General
# -------------------------------------------------------------------

export TERM=screen-256color 
export EDITOR=nvim
export DOT="$HOME/.dotfiles"

# Fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Debugging android images
export PATH="$HOME/.bootimg:$PATH"

# Android Studio
export PATH="$PATH:$HOME/.android/android-studio/bin"
export PATH="$PATH:$HOME/.android/sdk/tools"
export PATH="$PATH:$HOME/.android/sdk/platform-tools"

# Java 
export JAVA_HOME="/usr/lib/jvm/java-9-openjdk-amd64"
export JRE_HOME="$JAVA_HOME/jre"
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export PATH JAVA_HOME
export CLASSPATH=$JAVA_HOME/lib/tools.jar
export CLASSPATH=.:$CLASSPATH
export PATH JAVA_HOME CLASSPATH

# -------------------------------------------------------------------
# Brew
# -------------------------------------------------------------------

export BREWPATH="$HOME/.linuxbrew"
export PATH="$BREWPATH/bin:$BREWPATH/sbin:$PATH"
export MANPATH="$BREWPATH/share/man:$MANPATH"
export INFOPATH="$BREWPATH/share/info:$INFOPATH"
export XDG_DATA_DIRS="$BREWPATH/share:$XDG_DATA_DIRS"

# Rbenv 
export RBENV_ROOT="$BREWPATH/var/rbenv"
eval "$(rbenv init -)"

# PyEnv
export PYENV_ROOT="$BREWPATH/var/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Go
export GOPATH="$BREWPATH/var/go"
export PATH="$GOPATH/bin:$PATH"

# Zplug
unset ZPLUG_CACHE_FILE
export ZPLUG_HOME="$BREWPATH/opt/zplug"
export ZPLUG_CACHE_DIR="$BREWPATH/var/zplug/.cache"
export ZPLUG_REPOS="$BREWPATH/var/zplug/repos"

# -------------------------------------------------------------------
# Zplug configurations
# -------------------------------------------------------------------

source $ZPLUG_HOME/init.zsh

# Enable lazy load for nvm plugin
export NVM_LAZY_LOAD=true

# Plugins
# zplug "zplug/zplug"
# zplug "Valiev/almostontop"
zplug "djui/alias-tips"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "hlissner/zsh-autopair", defer:2
zplug "lukechilds/zsh-nvm"
zplug "wbinglee/zsh-wakatime"
zplug "dracula/zsh", as:theme
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/rails", from:oh-my-zsh

# Check if everything is installed
if ! zplug check; then
  zplug install
fi

zplug load

# -------------------------------------------------------------------
# Alias
# -------------------------------------------------------------------

alias fa='alias | ag'
alias strem="sh $HOME/.strem/Stremio.sh"
alias sudo="nocorrect sudo"
alias _="sudo"
alias md='mkdir -p'
alias rd=rmdir

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

# Brew
alias b="brew"
alias bi="b install"
alias bu="b update --verbose"
alias bubu="bu && b upgrade --verbose"
alias bl="b list"
alias bc="b cleanup"

# Zsh
alias sz="source ~/.zshrc"
alias zlt="/usr/bin/time zsh -i -c exit"

# Rails
alias s='spring'
alias srs='s rails s'
alias src='s rails c'
alias rddl='rake db:drop:all'
alias rre='rddl && rdc && rdm && rds'
alias rrf="rake routes | fzf-tmux"

# Rbenv
alias rb='rbenv'
alias rbg='rb gemset'

# Zplug
alias zu="zplug update"
alias zpc="zplug clean && zplug clear && sz"

# Git
alias glog="git log --graph --oneline --decorate --date-order --color --boundary"

# Nvim
alias nv='nvim'
alias pi="$EDITOR +PlugInstall"
alias pc="$EDITOR +PlugClean"
alias pu="$EDITOR +PlugUpdate"

# Tmux
alias tmux-kill-all="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# Gem
gi() { gem install $@; rbenv rehash; rehash }

# Config shortcuts
alias zshrc="$EDITOR $HOME/.zshrc"
alias tmuxconf= "$EDITOR $HOME/.tmux.conf"
alias nvimrc="$EDITOR $HOME/.config/nvim/init.vim"

# Projects
alias dot="$DOT"
alias work="$HOME/Projects/personal"
alias dnm="$HOME/Projects/personal/apps/denisa-metrics"

# Algorich
ALGORICH="$HOME/Projects/algorich"
alias npad="$ALGORICH/na-praia-admin"
alias npas="$ALGORICH/na-praia-app-seller"
alias npa="$ALGORICH/na-praia-app"
alias gal="$ALGORICH/galcorr"
alias sv="$ALGORICH/safeverse"
alias svt="$ALGORICH/safeverse-site"
alias delphos="$ALGORICH/delphos-map"

# Tocanet
TOCA="$HOME/Projects/tocanet"
alias dn="$TOCA/denisa"
alias osj="$TOCA/osj"

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
# Missing time
# -------------------------------------------------------------------
#
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# zplug "themes/nebirhos", from:oh-my-zsh, as:theme
# zplug "halfo/lambda-mod-zsh-theme", as:theme
# zplug "themes/amuse", from:oh-my-zsh, as:theme

# Issue
# zplug "zsh-users/zsh-autosuggestions"
# plugins=(bundler rake ruby gem)


# precmd() {
#   if [[ -n $PYENV_SHELL ]]; then
#     local version
#     version=${(@)$(pyenv version)[1]}
#     if [[ $version = system ]]; then
#       PROMPT="%(?.%F{magenta}.%F{red})❯%f "
#     else
#       PROMPT="(pyenv $version) %(?.%F{magenta}.%F{red})❯%f "
#     fi
#   fi
# }

# zplug "modules/history",    from:prezto
# zplug "modules/utility",    from:prezto
# zplug "modules/ruby",       from:prezto
# zplug "modules/ssh",        from:prezto
# zplug "modules/terminal",   from:prezto
# zplug "modules/directory",  from:prezto
# zplug "modules/completion", from:prezto

# zstyle ':prezto:module:terminal' auto-title 'yes'
# zstyle ':prezto:module:terminal:window-title' format '%n@%M: %s'
# zstyle ':prezto:module:terminal:tab-title' format '%s'

# zstyle ':prezto:module:utility:ls' color 'yes'
# zstyle ':prezto:module:utility:diff' color 'yes'
# zstyle ':prezto:module:utility:wdiff' color 'yes'
# zstyle ':prezto:module:utility:make' color 'yes'

# zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-history-substring-search"
# zplug "zsh-users/zsh-syntax-highlighting", nice:10
# zplug "tarruda/zsh-autosuggestions"

# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
