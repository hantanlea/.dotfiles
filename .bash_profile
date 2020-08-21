#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
 XDG_SESSION_TYPE="X11"
 exec startx
fi

source /home/nathan/.config/broot/launcher/bash/br
