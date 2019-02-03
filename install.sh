#!/bin/bash
# install.sh
# Installs the dotfiles and backs up old profile settings.
# Also, installs Vundle.vim. A :PluginInstall is required from within Vim.

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
printf "\nRunning install.\n"
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

cd $dir

printf "\n"
printf "%-15s %14s %15s\n" "File" "Backup" "Install"
for file in $files; do
    #back up file
    printf "${red}%-15s${end}" ".${file}"
    if [ -a ~/.$file ] && cmp -s ~/.$file $file; then
        printf "${red}%15s${end}" "Skipped"
    elif [ -a ~/.$file ]; then
        printf "${red}%15s${end}" "Done"
        mv ~/.$file $olddir
    else
        printf "${red}%15s${end}" "No File"
    fi

    #install file
    if [ -a ~/.$file ] && cmp -s ~/.$file $file; then
        printf "${red}%16s${end}\n" "Skipped"
    elif [ $os == "Cygwin" ] && ( [ $file == "minttyrc" ] || [ $file == "gitconfig" ] ); then
        printf "${red}%16s${end}\n" "Done"
        ln $dir/$file ~/.$file
    else
        printf "${red}%16s${end}\n" "Done"
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

printf "\n\n\n"
