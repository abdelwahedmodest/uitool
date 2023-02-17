#!/bin/bash

# Change this path to your desktop directory
desktop_dir="/home/abdelwahed/Bureau"

# List all the folders on the desktop
folders=( $(find "$desktop_dir" -maxdepth 1 -type d -not -path "$desktop_dir") )

# Loop through each folder and list all the files inside
for folder in "${folders[@]}"
do
    echo "Files in $folder:"
      find "$folder" -type f
        echo "-----------------------"
      done

