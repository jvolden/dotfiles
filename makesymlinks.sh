#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles 
# in ~/dotfiles
############################

########## Variables

dir=~/dotfiles     # dotfiles directory
olddir=~/.old       # old dotfiles backup directory
os=`uname -o`

# list of files/folders to symlink in homedir
files="profile bashrc vimrc gitconfig zshrc dir_colors vim"

########## Move files and link new ones.

# Create .old in homedir
echo "Running symlinks on $os"
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Move any existing dotfiles in homedir to .old directory, then create symlinks 
for file in $files; do
    if [ -a $file ]
        then
            echo "Moving $file from ~/ to $olddir"
            mv ~/.$file $olddir
        else
            echo "$file does not exist. Not moving anything."
    fi
    # Git doesn't like symlinks on Windows/Cygwin. Make it a hard link if so.
    if [ $os == "Cygwin" -a $file == "gitconfig" ]
        then
            echo "Creating HARDLINK to $file in home directory."
            ln $dir/$file ~/.$file
        else
            echo "Creating symlink to $file in home directory."
            ln -s $dir/$file ~/.$file
    fi
done
