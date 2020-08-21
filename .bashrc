#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /home/nathan/.config/broot/launcher/bash/br
eval "$(fasd --init auto)"
alias dotfiles='usr/bin/git --git-dir=/home/nathan/.dotfiles/ --work-tree=/home/nathan'
