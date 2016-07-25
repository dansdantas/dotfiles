# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="nebirhos"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler rake ruby gem rails alias-tips zsh-autopair zsh-wakatime zsh-syntax-highlighting)

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source $HOME/.scripts/resty

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="$HOME/.ssh/dsa_id"

### PERSONAL CONFIGURATIONS

export EDITOR='vim'

# Path to my configurations
export DOT="$HOME/.dotfiles"

# Rbenv configuration
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

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

#  Add zsh themes
[ -f "${DOT}/zshrc.alias" ] && source "${DOT}/zshrc.alias"

# Add zsh alias
[ -f "${DOT}/.zsh_aliases" ] && source "${DOT}/.zsh_aliases"

#  Default color configuration
export TERM=xterm-256color

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
