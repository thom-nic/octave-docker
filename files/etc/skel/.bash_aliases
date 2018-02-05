# shell aliases
# vi: ft=sh

alias ls='ls --color=auto'
alias l="ls -F"
alias la='ls -AF'
alias ll='ls -lhF'
alias bd='cd -'
alias up='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

alias md='mkdir -p'
alias grep='grep --color=auto'
alias lf='less -R --follow-name +F'  # tail -f using less
which less &>/dev/null || alias less='more'
