#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /home/nathan/.config/broot/launcher/bash/br
eval "$(fasd --init auto)"

# If .sh_aliases exists then source it
if [ -f ~/.sh_aliases ]; then
    . ~/.sh_aliases
fi
