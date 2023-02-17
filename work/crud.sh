#!/bin/bash

# Get list of all MP4 files in desktop directory and output as CSV
find ~/Desktop -maxdepth 1 -name "*.mp4" -printf "%f,%s,%p\n" > mp4_files.csv

# Define number of rows per page and current page number
rows_per_page=10
current_page=1

# Calculate total number of pages and total number of rows
total_rows=$(wc -l < mp4_files.csv)
total_pages=$((total_rows / rows_per_page))

# Function to generate the HTML table for a given page number
function generate_table {
  local page_number=$1
  local start_index=$((rows_per_page * (page_number - 1)))
  local end_index=$((start_index + rows_per_page))

  # Generate table headers
  cat <<EOF
  <table class="table table-striped">
    <thead>
        <tr>
              <th>Name</th>
                    <th>Size (MB)</th>
                          <th>Path</th>
                                <th>Operations</th>
                                    </tr>
                                      </thead>
                                        <tbody>
                                      EOF
                                    
                                      # Loop through CSV file and generate table rows for the given page
                                      while IFS= read -r line; do
                                          # Split CSV line into name, size, and path
                                            IFS=',' read -r -a fields <<< "$line"
                                              name=${fields[0]}
                                                size=$(echo "scale=2; ${fields[1]} / 1024 / 1024" | bc)
                                                  path=${fields[2]}
                                                
                                                    # Generate table row with name, size, and path
                                                      if ((start_index <= ${index} && ${index} < end_index)); then
                                                            cat <<EOF
                                                                <tr>
                                                                      <td>$name</td>
                                                                            <td>$size</td>
                                                                                  <td>$path</td>
                                                                                        <td>
                                                                                                <button class="btn btn-primary mr-1">Edit</button>
                                                                                                        <button class="btn btn-danger">Delete</button>
                                                                                                              </td>
                                                                                                                  </tr>
                                                                                                                EOF
                                                                                                                  fi
                                                                                                                
                                                                                                                    ((index++))
                                                                                                                    done < mp4_files.csv
                                                                                                                  
                                                                                                                    # Generate table footer with pagination links
                                                                                                                    cat <<EOF
                                                                                                                      </tbody>
                                                                                                                      </table>
                                                                                                                      <nav>
                                                                                                                        <ul class="pagination">
                                                                                                                            <li class="page-item ${current_page == 1 && 'disabled'}"><a class="page-link" href="?page=1">&laquo;</a></li>
                                                                                                                          EOF
                                                                                                                        
                                                                                                                          for ((page=1; page<=total_pages; page++)); do
                                                                                                                              if ((page == current_page)); then
                                                                                                                                    cat <<EOF
                                                                                                                                        <li class="page-item active"><a class="page-link" href="?page=$page">$page</a></li>
                                                                                                                                      EOF
                                                                                                                                        else
                                                                                                                                              cat <<EOF
                                                                                                                                                  <li class="page-item"><a class="page-link" href="?page=$page">$page</a></li>
                                                                                                                                                EOF
                                                                                                                                                  fi
                                                                                                                                                  done
                                                                                                                                                
                                                                                                                                                  cat <<EOF
                                                                                                                                                      <li class="page-item ${current_page == total_pages && 'disabled'}"><a class="page-link" href="?page=$total_pages">&raquo;</a></li>
                                                                                                                                                        </ul>
                                                                                                                                                        </nav>
                                                                                                                                                      EOF
                                                                                                                                                    }

                                                                                                                                                    # Generate HTML page with table for current page number
                                                                                                                                                    cat <<EOF
                                                                                                                                                    <!DOCTYPE html>
                                                                                                                                                    <html>
                                                                                                                                                    <head>
                                                                                                                                                      <title>MP4 Files</title>
                                                                                                                                                        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap
                                                                                                                                                        "
