#!/bin/bash

for var in "$@"
do
    echo "$var"
done

echo "$1 $3 $2 $4"

printf '%s\n' "$@" | sort