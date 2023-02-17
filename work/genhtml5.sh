#!/bin/bash

# Change the path to your desktop
#desktop_path="/home/user/Desktop"
desktop_path="/home/abdelwahed/Bureau"

# Change the name of the HTML file
html_file="index.html"

# Change the title of the HTML file
title="MP4 Files on Desktop"

# Start building the HTML table
html="<table class=\"table table-striped table-hover\"><thead><tr><th>Name</th><th>Size (MB)</th><th>Path</th></tr></thead><tbody>"

# Loop through the MP4 files and add a row to the HTML table for each file
while IFS= read -r -d '' mp4_file; do
    # Get the file name without the path and enclose it in double quotes
      name="$(basename "$mp4_file")"
        # Get the file size in megabytes
          size="$(du -h "$mp4_file" | cut -f1)"
            # Add a row to the HTML table with the file name in double quotes
              html="$html<tr><td>$name</td><td>$size</td><td>$mp4_file</td></tr>"
            done < <(find "$desktop_path" -name "*.mp4" -print0)

            # Finish building the HTML table
            html="$html</tbody></table>"

            # Create the HTML file
            echo "<!DOCTYPE html><html><head><title>$title</title><link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css\"></head><body><div class=\"container\">$html</div><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js\"></script><script src=\"app.js\"></script></body></html>" > "$html_file"

            # Create the JavaScript file for CRUD operations
            echo "console.log('Hello, World!');" > app.js

