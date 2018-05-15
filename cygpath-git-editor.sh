#!/bin/bash

# Thanks to nickbudi!
# https://gist.github.com/nickbudi/4b489f50086db805ea0f3864aa93a9f8

# extract last argument (the file path)
for last; do true; done

# get all the initial command arguments
all="${@:1:$(($#-1))}"

# launch editor with windows path
code $all $(cygpath -w $last)
