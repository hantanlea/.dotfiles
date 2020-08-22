#!/bin/bash

# Any dotfiles in home directory present in repo will be renamed with .old then new file created and symlinked to file in repo

dir="$(pwd)" 
for f in .[^.]* 
do
   if [ $f != '.git' ] && [ $f != '.gitignore' ]
   then
      echo "Moving $HOME/$f to $HOME/$f.old"
      mv "$HOME/$f" "$HOME/$f.old"
      echo "Importing $f"
      ln -s "$dir/$f" "$HOME/$f"
   fi
done
