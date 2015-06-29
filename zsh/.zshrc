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
plugins=(git zsh-syntax-highlighting colored-man alias-tips command-not-found mvn suse)

export PATH=/bin/:/usr/bin/

source $ZSH/oh-my-zsh.sh

fpath=(/home/avolpe/.oh-my-zsh/custom/autocomplete/zsh-completions-master/src/ $fpath)
rm -f ~/.zcompdump; compinit
export EDITOR=vim

#mwiki() { dig +short txt "$*".wp.dg.cx; }

# Customize to your needs...

export MAN_POSIXLY_CORRECT=1 

#[ -f ~/.last_dir ] && cd `cat ~/.last_dir`

LS_COLORS="$LS_COLORS:di=0;91:ln=4"  ; export LS_COLORS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#if [ -f ~/.proxy_status ]
#then
	#WITH_PROXY=`cat ~/.proxy_status`
	#echo $WITH_PROXY
	#if [ "$WITH_PROXY" = "WITHOUT PROXY" ]
	#then
		#. ~/scripts/unset_proxy > /dev/null
	#else
		#. ~/scripts/export_proxy avolpe asdaed > /dev/null
	#fi
#fi

PATH="~/.gem/ruby/2.1.0/bin:$PATH"

setopt correct_all
source ~/scripts/zsh/completition/tmuxinator.zsh
#source ~/.zsh_prompt.sh
