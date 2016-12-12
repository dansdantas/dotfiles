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
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# -------------------------------------------------------------------
# General
# -------------------------------------------------------------------

export TERM=screen-256color 
export EDITOR=nvim
export DOT="$HOME/.dotfiles"

# Resty
source $HOME/.worklate/.scripts/resty

# Fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Debugging android images
export PATH="$HOME/.bootimg:$PATH"

# Android Studio
export PATH="$PATH:$HOME/.android/android-studio/bin"
export PATH="$PATH:$HOME/.android/sdk/tools"
export PATH="$PATH:$HOME/.android/sdk/platform-tools"

# Java configurations
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
export PATH=$JAVA_HOME/bin:$PATH
export PATH JAVA_HOME
export CLASSPATH=$JAVA_HOME/lib/tools.jar
export CLASSPATH=.:$CLASSPATH
export PATH JAVA_HOME CLASSPATH

# -------------------------------------------------------------------
# Brew install
# -------------------------------------------------------------------

export BREWPATH="$HOME/.linuxbrew"
export PATH="$BREWPATH/bin:$BREWPATH/sbin:$PATH"
export MANPATH="$BREWPATH/share/man:$MANPATH"
export INFOPATH="$BREWPATH/share/info:$INFOPATH"
export XDG_DATA_DIRS="$BREWPATH/share:$XDG_DATA_DIRS"

# Rbenv configuration
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
zplug "zplug/zplug"
zplug "djui/alias-tips"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "hlissner/zsh-autopair", defer:2
zplug "lukechilds/zsh-nvm"
zplug "wbinglee/zsh-wakatime"
zplug 'dracula/zsh', as:theme
zplug "plugins/git", from:oh-my-zsh, as:plugin
zplug "plugins/rails", from:oh-my-zsh, as:plugin

# Check if everything is installed
if ! zplug check; then
  zplug install
fi

# Load - workaround
zplug load >/dev/null

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
# Folders
# -------------------------------------------------------------------

alias sv="$HOME/Projects/algorich/safeverse"
alias svt="$HOME/Projects/algorich/safeverse-site"
alias delphos="$HOME/Projects/algorich/delphos-map"
alias npad="$HOME/Projects/algorich/na-praia-admin"
alias npas="$HOME/Projects/algorich/na-praia-app-seller"
alias npa="$HOME/Projects/algorich/na-praia-app"
alias gal="$HOME/Projects/algorich/galcorr"
alias dn="$HOME/Projects/tocanet/denisa"
alias osj="$HOME/Projects/tocanet/osj"
alias it="$HOME/Projects/github/itask"
alias dnm="$HOME/Projects/personal/denisa-metrics"
alias dot="$DOT"
alias work="$HOME/.worklate"

# -------------------------------------------------------------------
# Folders movements
# -------------------------------------------------------------------

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias ls="ls --color=auto"
alias lh='ls -l .??*'
alias lhd='ls -ld .??*'
alias lh='ls -a | egrep "^\."'

# -------------------------------------------------------------------
# Scripts
# -------------------------------------------------------------------

alias nv='nvim'
alias s='spring'
alias srs='s rails s'
alias src='s rails c'
alias sz="source ~/.zshrc"
alias zlt="/usr/bin/time zsh -i -c exit"
alias fa='alias | ag'
alias rddl='rake db:drop:all'
alias rre='rddl && rdc && rdm && rds'
alias rb='rbenv'
alias rbg='rb gemset'
alias rrf="rake routes | fzf-tmux"
alias strem="sh $HOME/.strem/Stremio.sh"
alias zpc="zplug clean && zplug clear && sz"
alias zu="zplug update"

# -------------------------------------------------------------------
# Vim, Nvim
# -------------------------------------------------------------------

alias pi="$EDITOR +PlugInstall"
alias pc="$EDITOR +PlugClean"
alias pu="$EDITOR +PlugUpdate"

# -------------------------------------------------------------------
# Tmux
# -------------------------------------------------------------------
alias tmux-kill-all="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# -------------------------------------------------------------------
# Edit
# -------------------------------------------------------------------

alias vimrc="$EDITOR ~/.vimrc"
alias zshrc="$EDITOR ~/.zshrc"
alias vundles="$EDITOR ~/.vimrc.bundles"
alias tmuxconf= "$EDITOR ~/.tmux.conf"
alias zshconfig="$EDITOR ~/.zshrc"

# -------------------------------------------------------------------
# Misc
# -------------------------------------------------------------------

alias diff="colordiff"
alias df="df -H"
alias du="du -ch"
alias 'dus=du -sckx * | sort -nr'
alias sudo="nocorrect sudo"
alias _="sudo"
alias update="sudo apt-get update && sudo apt-get upgrade && sudo apt-get update && sudo apt-get upgrade"
alias install="sudo apt-get install"
alias search="sudo apt-cache search"
alias purge="sudo apt-get purge"
alias glog="git log --graph --oneline --decorate --date-order --color --boundary"

# -------------------------------------------------------------------
# Abbreviation for "gem install".
# -------------------------------------------------------------------

gi() { gem install $@; rbenv rehash; rehash }

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
