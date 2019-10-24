#!/bin/bash
# install.sh
#
# Installs the dotfiles and backs up old profile settings.
#
# These dotfiles checks that vim, zsh, and git are installed.
#
# To add files or directories to the dotfile, simply copy them to the dotfiles
# folder.
#
# $ cp <directory/file> ~/dotfiles
#
# **Possibly dump mintytc?**
# On Windows, all links are symbolic links except gitconfig and minttyrc. 
# Windows complains unless these are hard links.
# TODO: Functions!

# Pre-reqs
# vim, zsh, git, {?}..
hash vim 2>/dev/null || { echo >&2 "Please install Vim.  Aborting."; exit 1; }
hash zsh 2>/dev/null || { echo >&2 "Please install Zsh.  Aborting."; exit 1; }
hash git 2>/dev/null || { echo >&2 "Please install Git.  Aborting."; exit 1; }

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

# Build array of directories/files for installation.
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

git submodule update --init --recursive
vim -c ':PlugInstall'

unset files remove
