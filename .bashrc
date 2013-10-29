#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

set_prompt_style () {
  PS1="┌─[\[\e[34m\]\u@\h\[\e[0m\]][\[\e[32m\]\w\[\e[0m\]][\t]\[\033[0;31m\]\$(__git_ps1)\[\e[0m\]\n└─╼ "
}
set_prompt_style

alias ls='ls -hG'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias vim='vim -o'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
