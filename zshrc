export TERM=xterm-256color
export EDITOR='vim'
export DOT="$HOME/.dotfiles"

[ -f "${DOT}/zshrc.alias" ] && source "${DOT}/zshrc.alias"
[ -f "${DOT}/.zsh_aliases" ] && source "${DOT}/.zsh_aliases"

# Rbenv configuration
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Android Studio
export PATH="$PATH:$HOME/.android/android-studio/android-studio/bin"
export PATH="$PATH:$HOME/.android/sdk/tools"
export PATH="$PATH:$HOME/.android/sdk/platform-tools"

### Java
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
export PATH=$JAVA_HOME/bin:$PATH
export PATH JAVA_HOME
export CLASSPATH=$JAVA_HOME/lib/tools.jar
export CLASSPATH=.:$CLASSPATH
export PATH JAVA_HOME CLASSPATH

# Neovim
export PATH="$HOME/.neovim/bin:$PATH"

# Fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Zsh configurations
setopt auto_cd
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Bindings
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export NVM_LAZY_LOAD=true
source $HOME/.worklate/.scripts/resty
source $HOME/.zplug/init.zsh

zplug "hlissner/zsh-autopair", nice:10
zplug "zsh-users/zsh-completions"
zplug "djui/alias-tips"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "themes/nebirhos", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/rails", from:oh-my-zsh, nice:10
zplug "lukechilds/zsh-nvm"
zplug "zplug/zplug"
# plugins=( bundler rake ruby gem rails npm alias-tips zsh-autopair zsh-wakatime zsh-syntax-highlighting)

# Issue
# zplug "zsh-users/zsh-autosuggestions"

if ! zplug check; then
  zplug install
fi

zplug load
