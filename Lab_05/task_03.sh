#!/bin/bash

for var in "$@"
do
    echo "$var"
done


echo "$1 $3 $2 $4"

fruits=("banana" "cherry" "apple" "date" "grape")

printf '%s\n' "${fruits[@]}" | sort