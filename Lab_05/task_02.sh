#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file>"
    exit 1
fi

destination_directory="$HOME/tmp"
if [ ! -d "$destination_directory" ]; then
    mkdir "$destination_directory"
fi

cp "$1" "$destination_directory"

echo "File copied successfully to $destination_directory"
