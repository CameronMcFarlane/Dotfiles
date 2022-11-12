#!/bin/bash
# This script symlinks all dotfiles and adds .myenv to the bash profile

# Prompts the user with a yes or no question
prompt () {
  PROMPT=$1
  read -p "$PROMPT (Y/n): " ANSWER
  # Reminder: a function returns the exit code from the last executed command
  [ -z $ANSWER ] || [ $ANSWER == "y" ] || [ $ANSWER == "Y" ]
}

# Creates a symbolic link for the given dotfile in the home directory
link() {
  FILE=$1
  CONFIGTARGET=$DOTFILES/$FILE
  CONFIGLINK=$HOME/$FILE
  
  printf "\nCreating link from $CONFIGTARGET to $CONFIGLINK\n"

  if [ -f $CONFIGLINK ]; then
    if $(prompt "Overwrite existing $FILE?"); then
      rm $CONFIGLINK
      ln -s $CONFIGTARGET $CONFIGLINK
    else
      echo "Skipping $FILE"
      return 1
    fi
  else
    ln -s $CONFIGTARGET $CONFIGLINK
  fi
}

echo "Setting up in $HOME..."

# Get the absolute path for the dotfiles directory
DOTFILES=$(cd "$(dirname "${BASH_SOURCE}")" &> /dev/null && pwd)

# Create symlink for .myenv
if link .myenv; then
  echo ".myenv linked successfully"
  
  # Include .myenv in bash profile
  if $(prompt "Include .myenv in bash profile?"); then
    if [ -f $HOME/.profile ]; then
      printf "\nif [ -f \$HOME/.myenv ]; then . \$HOME/.myenv; fi\n\n" >> $HOME/.profile
      echo "Appended include statement to .profile"
    else
      echo "$HOME/.profile could not be found"
    fi
  fi
fi

# Create symlink for .gitconfig
if link .gitconfig; then
  echo ".gitconfig linked succesfully"
fi

# Create symlink for .tmux.conf
if link .tmux.conf; then
  echo ".tmux.conf linked succesfully"
fi

# Create symlink for .vimrc
if link .vimrc; then
  echo ".vimrc linked succesfully"
fi

printf "\nDone!\n"
