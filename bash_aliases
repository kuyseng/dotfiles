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
alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'
alias tree='tree -L 1'

#alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'


# Custom alias
#alias proxy='ssh -L 8765:localhost:8765 pair@184.106.240.141'

alias migrate='rake db:migrate && rake db:migration RAILS_ENV=test'

CDPATH=.:~:~/workspace/:~/workspace/MakeHandDirty/
alias tom='sudo /etc/init.d/tomcat7 restart'
alias work='cd ~/workspace/yoolk_core/engines/service_catalog'

alias irbgem='gem install map_by_method interactive_editor looksee awesome_print fancy_irb'
