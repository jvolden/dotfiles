#!/bin/bash

# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles 
# in ~/dotfiles

# Variables
dir=~/dotfiles      # dotfiles directory
olddir=~/.old       # old dotfiles backup directory
os=`uname -o`

# Colors
red=$'\e[1;31m'
end=$'\e[0m'

# List of files. Space seperated.
files="tmux.conf minttyrc profile bashrc vimrc gitconfig zshrc dir_colors vim"

# Pre-install
printf "\nRunning symlinks script\n"
printf "Detected OS: ${red}%s${end}\n" "[$os]"
printf "Dotfiles: ${red}%s${end}\n" "$files"
printf "Creating backup folder: ${red}%s${end}\n" "[$olddir]"
if [ -a $olddir ]; then
    printf "Backup directory already exists.\n"
    exit
fi
mkdir -p $olddir

# Change working directory
printf "Changing directory: ${red}%s${end}\n" "[$dir]"
cd $dir

# Backup files
printf "\n"
for file in $files; do
    if [ -a ~/.$file ]; then
        printf "Backing up: ${red}%s${end}\n" "[.$file]"
        mv ~/.$file $olddir
    else
        echo ".$file does not exist. Not moving anything."
    fi
done

# Create symlinks
printf "\n"
for file in $files; do
    if [ $os == "Cygwin" -a $file == "minttyrc" ]; then
        printf "Creating symlink: ${red}%s${end}[cygwin only]\n" "[$file]"
        ln $dir/$file ~/.$file
    else
        printf "Creating symlink: ${red}%s${end}\n" "[$file]"
        ln -s $dir/$file ~/.$file
    fi
done

# Post install
printf "\nAfter new shell installs, run the following command.\n"
printf "> ${red}cd ~/dotfiles && git submodule init && git submodule update${end}\n\n"
