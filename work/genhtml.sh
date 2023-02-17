#!/bin/bash

# Change the path to your desktop
desktop_path="/home/abdelwahed/Bureau"

# Change the name of the HTML file
html_file="index.html"

# Change the title of the HTML file
title="MP4 Files on Desktop"

# Get the list of MP4 files on the desktop
mp4_files=($(find "$desktop_path" -name "*.mp4" -print0 ))


# Loop through the MP4 files and add a row to the HTML table for each file
for mp4_file in "${mp4_files[@]}"
do
    # Get the file name without the path
      name=$(basename "$mp4_file")
      echo  $name ;
        # Get the file size in megabytes
        #size=$(du -m "$mp4_file" | cut -f1)
	#echo $size ;  
        done

           
