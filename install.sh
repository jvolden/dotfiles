#!/bin/bash
# install.sh
#
# Installs the dotfiles and backs up old profile settings.
#
# These dotfiles assumes vim, zsh, and git are installed.
# Also, installs Vundle.vim. A :PluginInstall is required from within Vim.
#
# To add files or directories to the dotfile, simply copy them to the dotfiles
# folder.
#
# $ cp <file> ~/dotfiles
# $ cp <directory> ~/dotfiles
#
# On Windows, all links are symbolic links except gitconfig and minttyrc. 
# Windows complains unless these are hard links.

# Variables
dir=~/dotfiles
current=`pwd -P`
olddir=~/.old
os=`uname -o`
# Font formats
udl=$'\e[4m'
bld=$'\e[1m'
red=$'\e[31m'
end=$'\e[0m'

# Pretty pretty
header="%-25s %39s\n"
lnheader="%-15s %7s %20s %20s\n"
lnformat="%-15s %7s %20s %20s\n"
divider=---------------------------------
divider=$divider$divider$divider

# Pre-installation commands
printf "\n\n${header}" "Running:" "${PWD}/${0##*/}"
printf "${header}" "Detected OS:" "$os"
if [ "${current}" != "${dir}" ]
then
    printf "%-s ${red}%s${end}\n" "Changing directory:" "${dir}"
    cd $dir
fi
if [ ! -d $olddir ] 
then
    printf "%-s ${red}%s${end}\n" "Creating backup folder:" "$olddir"
    mkdir -p $olddir
fi

# Build items array for installation.
files=(* .[^.]*)
# Items we don't want to symlink.
remove=(README.md install.sh .gitignore .git)
for item in "${remove[@]}"
do
    for file in "${!files[@]}"
    do
        if [[ $item = "${files[file]}" ]] 
        then
            #echo -e Removing "${files[file]}"
            unset "files[file]"
        fi
    done
done
printf "${header}" "Files found: " "${#files[@]}"

# Symlink file information
printf "\n\n${header}" "Creating symlinks" "****"
printf "${lnheader}" "Name" "Type" "Backup" "Install"
printf "%65.65s\n" "${divider}"

# Process each item
for file in ${files[@]}
do
    #back up file
    if [ -a ~/.${file} ] && cmp -s ~/.${file} ${file}
    then
        backup="Same as new"
    elif [ -a ~/.${file} ]
    then
        backup="Done"
        mv ~/.${file} $olddir
    else
        backup="No file"
    fi

    #install file
    if [ -a ~/.${file} ] && cmp -s ~/.${file} ${file}
    then
        install="Same as new"
    elif [ $os == "Cygwin" ] && ( [ ${file} == "minttyrc" ] || [ ${file} == "gitconfig" ] ); then
        install="Installed"
        ln $dir/${file} ~/.${file}
    else
        install="Installed"
        ln -s $dir/${file} ~/.${file}
    fi

    #output
    if [ -d ${file} ]
    then
        type="[Dir]"
    else
        type="[File]"
    fi
    printf "${lnformat}" ".${file}" "${type}" "${backup}" "${install}"
done

# Post install/Vundle
if [ -a ~/dotfiles/vim/bundle/Vundle.vim ]; then
    printf "\n${header}\n" "Vundle.vim detected: " "Skipping"
else
    printf "\nInstall Vundle.vim? [y/n]: "
    read vundleanswer
    if [ $vundleanswer == y ]; then
        git clone https://github.com/VundleVim/Vundle.vim ~/dotfiles/vim/bundle/Vundle.vim
        printf "\nYou must run vim and type :PluginInstall\n\n"
    else
        exit
    fi
fi
unset files remove