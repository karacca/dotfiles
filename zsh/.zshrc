# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the Java Home to Android Studio's JBR
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Path for pub-cache
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Path for Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# ZSH Theme
ZSH_THEME="zhann"

# ZSH Update Mode
zstyle ':omz:update' mode reminder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export LANG=en_US.UTF-8

# Aliases
source $HOME/.aliases.zsh

# ZSH Autosuggestions and Syntax Highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
