# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aussiegeek"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


##############################
# Customize to your needs...
##############################
export EDITOR="vim"
# start in command mode
#zle-line-init() { zle -K vicmd; }
#zle -N zle-line-init

# show cursor related to command and insert mode

#vim_ins_mode="[INS]"
#vim_cmd_mode="[CMD]"
#vim_mode=$vim_ins_mode

#function zle-keymap-select {
  #vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  #zle reset-prompt
#}
#zle -N zle-keymap-select

#function zle-line-finish {
  #vim_mode=$vim_ins_mode
#}
#zle -N zle-line-finish

#RPROMPT='${vim_mode}'

#end
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# config use vim in zsh
#bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode
#bindkey '^R' history-incremental-search-backward

#My config hahah :D
CDPATH=.:~:~/Desktop:~/workspace/:~/workspace/MakeHandDirty/

autoload zmv
#Alias (Normal Alias)
alias x='exit'
alias q='exit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -G'

alias tom=''
alias mongo_repair='rvmsudo rake mongo:repair'
alias turbo='tmuxinator turbo'
alias instant='tmuxinator instant'

# make vim in tmux with correct colortheme ##
#alias tmux='tmux -2'
[ -z "$TMUX" ] && export TERM=xterm-256color


######Zshell Alias#######
# global -g (appear anywhere)
alias -g gp="| grep -i" # e.g. ps ax gp ruby #=> ps ax | grep -i ruby
alias -g t="RAILS_ENV=test"
# suffix -s (open with..)
alias -s rb=vim         # e.g. test.rb #=> vim test.rb
alias -s html='chromium-browser'

# load tmux auto
#if [[ ! $TERM =~ screen ]]; then
    #exec tmux
#fi
#
# function help to get shell built-in commands
# http://rhydd.org/blog/zsh-help/
#
 help(){ #This function used to call the "bash" builtin. #bash -c "help $@"

 #Better way: look it up in the man pages. I often look up "test" which doesn't give a usefull result,
 #so I added that as a special case.
 if [[ $1 == "test" ]]; then
   man --pager="less -p'^CONDITIONAL EXPRESSIONS$'" zshall
 else
   man --pager="less -p'^ *$@ '" zshall
 fi
       }
 #
 # 1311140013: make these alias to prevent from accidently run shutdown or init 0 in remote server
 alias SD="sudo init 0 --verbose"
 alias RS="sudo init 6 --verbose" # == reboot
 alias xps="ssh -Y bentio@cambodia-yellowpages.dev"
 alias off="xset dpms force off"
