#!/bin/bash
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles 
# in ~/dotfiles

# Variables
dir=~/dotfiles      # dotfiles directory
olddir=~/.old       # old dotfiles backup directory
os=`uname -o`
pad1=25
pad2=20
sepleft="["
sepright="]"

# Colors
red=$'\e[1;31m'
end=$'\e[0m'

# List of files.
# Add any files. One per line.
files="minttyrc
       profile 
       bashrc 
       vimrc 
       gitconfig 
       zshrc 
       dir_colors 
       vim 
       zsh
       tmux.conf"

# Pre-installation commands
printf "\nRunning symlinks script\n"
printf "\n"
if [ -a $olddir ]; then
    printf "Backup directory already exists. Overwrite? [y/n]: "
    read answer
    if [ $answer == y ]; then
        # Not safe. Another way?
        rm -rf $olddir
    else
        exit
    fi
fi
printf "\n"
printf "%-${pad1}s ${red}%${pad2}s${end}\n" "Detected environment:" "$os"
printf "\n"
total=0
for file in $files; do
    printf "%-${pad1}s ${red}%${pad2}s${end}\n" "Dotfiles:" "$file"
    ((total++))
done
printf "%${pad1}s %${pad2}d\n" "Total files: " "$total"
printf "\n"
printf "%-${pad1}s ${red}%${pad2}s${end}\n" "Changing directory:" "${dir}"
printf "%-${pad1}s ${red}%${pad2}s${end}\n" "Creating backup folder:" "$olddir"
mkdir -p $olddir

# Change working directory
cd $dir

# Backup files
printf "\n"
for file in $files; do
    if [ -a ~/.$file ]; then
        printf "%-${pad1}s ${red}%${pad2}s${end}\n" "Backing up:" ".$file"
        mv ~/.$file $olddir
    else
        printf "Skipping: ${red}%s${end} does not exist.\n" ".$file"
    fi
done

# Create symlinks
printf "\n"
for file in $files; do
    if [ $os == "Cygwin" -a $file == "minttyrc" ]; then
        printf "%-${pad1}s ${red}%${pad2}s${end}\n" "Creating symlink:" ".$file"
        ln $dir/$file ~/.$file
    else
        printf "%-${pad1}s ${red}%${pad2}s${end}\n" "Creating symlink:" ".$file"
        ln -s $dir/$file ~/.$file
    fi
done

# Post install/Vundle
printf "\n"
if [ -a ~/dotfiles/vim/bundle/Vundle.vim ]; then
    printf "Vundle.vim folder already exists. Skipping Vundle install."
else
    printf "Install Vundle.vim? [y/n]: "
    read vundleanswer
    if [ $vundleanswer == y ]; then
        git clone https://github.com/VundleVim/Vundle.vim ~/dotfiles/vim/bundle/Vundle.vim
        printf "You must run vim and type :PluginInstall"
    else
        exit
    fi
fi

printf "\n"
