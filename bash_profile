export EDITOR="vim"
export NODE_PATH="/usr/local/lib/node"
export PATH=$HOME/bin:$PATH
export PATH="/usr/local/share/npm/bin":$PATH

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

function prompt {
	local LIGHT_RED="\[\033[1;31m\]"
	local LIGHT_GREEN="\[\033[1;32m\]"
	local NO_COLOUR="\[\033[0m\]"

	local TITLEBAR='\[\033]0;\u@\h\007\]'

	export GIT_PS1_SHOWDIRTYSTATE=true
	export GIT_PS1_SHOWUNTRACKEDFILES=true
	export GIT_PS1_SHOWUPSTREAM=auto
	export GIT_PS1_SHOWSTASHSTATE=true

	PS1="$TITLEBAR\n\W/$LIGHT_GREEN\$(__git_ps1 ' (%s)') $LIGHT_RED\$(~/.rvm/bin/rvm-prompt i v g)\n$NO_COLOUR$ "
}

#call the prompt function to set things in motion
prompt

source /home/administrator/.rvm/scripts/rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
