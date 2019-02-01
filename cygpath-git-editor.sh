#!/bin/bash
PATH="/usr/bin:$PATH"
args=()
for arg in $1
do
  if [ "${arg:1:2}" = ':\' ]
  then
    args+=("$(cygpath -u "$arg")")
  elif [[ ${arg:0:4} == :?:\\ ]]
  then
    args+=(":$($(cygpath -u "${arg:1}"))")
  else
    args+=("$arg")
  fi
done

if [ "${args[0]}" = rev-parse ] && [ "${args[1]}" = "--show-toplevel" ]
then
  result="$(git "${args[@]}")"
  s="$?"
  cygpath -w "$result"
  exit "$s"
else
  exec git "${args[@]}"
fi
