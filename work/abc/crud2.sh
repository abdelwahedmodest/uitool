#!/bin/bash

# Set directory to desktop
DIR="/home/abdelwahed/Bureau"

# Set the output file name
OUTPUT_FILE="index.html"

# Define the HTML header
HTML_HEADER='<!DOCTYPE html>
<html>
<head>
    <title>MP4 Files on Desktop</title>
    <link rel="stylesheet" href="/bootstrap.min.css">
    
</head>
<body>
    <div class="container">
        <h1>MP4 Files on Desktop</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Size (MB)</th>
                    <th>Path</th>
                    <th>Operations</th>
                </tr>
            </thead>
            <tbody>'

# Define the HTML footer
HTML_FOOTER='</tbody>
        </table>
    </div>
</body>
<script  type="text/javascript" src="/jquery-3.6.1.js"></script>
<script   type="text/javascript"  src="/bootstrap.min.js"></script>
</html>'

# Define the function to calculate file size in MB
function calculate_file_size() {
    local file=$1
    local size=$(du -m "$file" | cut -f1)
    echo "$size"
}

# Define the function to generate HTML for a single row
function generate_html_row() {
    local name="$1"
    local path="$2"
    local size="$3"
    local operations='<div class="btn-group" role="group" aria-label="CRUD operations">
                            <button type="button" class="btn btn-sm btn-primary">Create</button>
                            <button type="button" class="btn btn-sm btn-success">Read</button>
                            <button type="button" class="btn btn-sm btn-warning">Update</button>
                            <button type="button" class="btn btn-sm btn-danger">Delete</button>
                        </div>'
    local html_row="<tr><td>$name</td><td>$size</td><td>$path</td><td>$operations</td></tr>"
    echo "$html_row"
}

# Generate the HTML table body
html_table_body=""
while IFS= read -r -d $'\0' file; do
    name=$(basename "$file")
    path=$(dirname "$file")
    size=$(calculate_file_size "$file")
    html_table_body+=$(generate_html_row "$name" "$path" "$size")
done < <(find "$DIR" -name "*.mp4" -type f -print0)

# Define the HTML content
HTML_CONTENT="$HTML_HEADER$html_table_body$HTML_FOOTER"

# Write the HTML content to the output file
echo "$HTML_CONTENT" > "$OUTPUT_FILE"

