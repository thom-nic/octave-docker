# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTFILE=/source/.bash_history
HISTCONTROL=ignoreboth
HISTIGNORE="&: *:[bf]g:exit:logout"
HISTSIZE=1000
HISTFILESIZE=2000

export EDITOR=vim

shopt -s cdspell
shopt -s checkwinsize
shopt -s no_empty_cmd_completion
shopt -s histappend
shopt -s cmdhist

# We have color support; assume it's compliant with Ecma-48
[ -x /usr/bin/tput ] && /usr/bin/tput setaf 1 >&/dev/null && color_prompt=yes

if [ "$color_prompt" = yes ]; then
  # Window title format: user@host [dir]
  shell_title='\e]0;\w [\u@\h]\a'
  # Prompt format: user@host [dir] \n$
  prompt='\n\[\e[34m\]\u\[\e[37m\]@\[\e[32m\]\h \[\e[33m\]\w\[\e[0m\]'
  # shell title must be the last line printed for screen
  PS1=${prompt}'\n\['${shell_title}'\]\$ '
  unset shell_title prompt
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

export LS_COLORS='fi=0:di=34:ln=36:ex=35:pi=5;44:so=5;44:bd=35;42:cd=36;42:or=37;41:mi=33;41'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

