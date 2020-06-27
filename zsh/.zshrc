# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
#DISABLE_CORRECTION="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting alias-tips mvn git docker docker-compose zsh-autosuggestions gpg-agent)

fpath=($HOME/.oh-my-zsh/custom/autocomplete/zsh-completions-master/src/ $fpath)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

# Customize to your needs...

export MAN_POSIXLY_CORRECT=1

# Only use the last dir if the current dir is home
[ "${PWD##/Users/arturovolpe/}" "==" "${PWD}" ] && lcd

LS_COLORS="$LS_COLORS:di=1;92:ln=4:tw=4;35:ow=1;35:"  ; export LS_COLORS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#if which ruby >/dev/null && which gem >/dev/null; then
    #PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi

setopt correct_all
bindkey "^Q" push-input


# Configuración de fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export ANDROID_HOME=~/Library/Android/sdk/


#export PATH="/Users/arturovolpe/.gem/ruby/2.4.0:/usr/local/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=247


# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/arturovolpe/.programs/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/arturovolpe/.programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/arturovolpe/.programs/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/arturovolpe/.programs/google-cloud-sdk/completion.zsh.inc'; fi

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home

export PATH="${ANDROID_HOME}emulator/:${ANDROID_HOME}platform-tools/:/usr/local/sbin:/usr/local/bin:$HOME/.yarn/bin:$HOME/programs/flutter/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/programs/forgit/forgit.plugin.zsh" && source "${HOME}/programs/forgit/forgit.plugin.zsh"


HISTCONTROL=ignoreboth

source /Users/arturovolpe/Library/Preferences/org.dystroy.broot/launcher/bash/br

#export LC_ALL=en_US
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
