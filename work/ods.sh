#!/bin/bash

# Navigate to the Desktop directory
cd ~/Bureau

# Create an empty LibreOffice Calc file
touch mp4_files.ods

# Add the header row to the file
echo -e "Name\tSize (MB)\tPath" > mp4_files.ods

# Find all the .mp4 files on the desktop
find . -type f -iname "*.mp4" -print0 | while read -d $'\0' file
do
    # Get the size of the file in megabytes
      size=$(du -m "$file" | cut -f 1)

        # Get the file name
          name=$(basename "$file")

            # Get the path to the file
              path=$(realpath "$file")

                # Add the file details to the LibreOffice Calc file
                  echo -e "$name\t$size\t$path" >> mp4_files.ods
                done

