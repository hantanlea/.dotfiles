#!/bin/bash

# Any dotfiles in home directory present in repo will be renamed with .old then new file created and symlinked to file in repo

dir="$(pwd)" 
for f in .[^.]* 
do
   if [[ ! $f =~ '^\.git.*' ]]; then
      if [[ -f ~/$f ]]; then
         read -p "Move $HOME/$f to $HOME/$f.old and replace with .dotfiles/$f?" -n 1 -r
         if [[ $REPLY =~ ^[Yy]$ ]]; then
            mv -i "$HOME/$f" "$HOME/$f.old"
            ln -s "$dir/$f" "$HOME/$f"
            echo "$f imported successfully"
         else
            echo "$f NOT IMPORTED"
         fi
      else
         read -p "$f does not exist in your home directory. Import from .dotfiles?" -n 1 -r
         if [[ $REPLY =~ ^[Yy]$ ]]; then
            ln -s "$dir/$f" "$HOME/$f"
         fi
      fi
   fi
done
