#!/bin/bash

if [[ "$1" != "--no-backup" ]]
then
  mkdir -p "/$HOME/safe"
  for var in "$@:1"
  do
    cp "$var" "/$HOME/safe"
    rm "$var"
  done
else
  for var in "$@:1"
  do
    rm "$var"
  done
fi


