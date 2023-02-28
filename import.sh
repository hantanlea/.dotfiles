#!/bin/bash

# This script is for importing dotfiles from git repository into a new system and backing up the current dotfiles as .old files in ~
# This script does not need to be run on a system where the dotfiles are already symlinked to the ~/.dotfiles dir
# To import, first create ~/.dotfiles dir then git clone into the dir then run script
# Script will interactively ask you for each file if you wish to make the change
# Any dotfiles in home directory present in repo will be renamed with .old then new file created and symlinked to file in repo

ignore="^\.git.*"
dir="$(pwd)" 

for f in .[^.]* 
do
   if [[ ! $f =~ $ignore ]]; then
      if [[ -f ~/$f ]]; then
         read -p "Move $HOME/$f to $HOME/$f.old and replace with .dotfiles/$f? " -n 1 -r
         if [[ $REPLY =~ ^[Yy]$ ]]; then
            mv -i "$HOME/$f" "$HOME/$f.old"
            ln -s "$dir/$f" "$HOME/$f"
            echo "\n$f Imported successfully\n"
         else
            echo "\n$f NOT IMPORTED\n"
         fi
      else
         read -p "$f does not exist in your home directory. Import from .dotfiles?/n" -n 1 -r
         if [[ $REPLY =~ ^[Yy]$ ]]; then
            ln -s "$dir/$f" "$HOME/$f"
         fi
      fi
   fi
done
