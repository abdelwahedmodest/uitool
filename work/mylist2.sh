#!/bin/bash

# set the directory you want to search
directory="/home/abdelwahed/Bureau"

# use the find command to search for all files with the ".mp4" extension
# in the directory specified, and display their size, modification time,
# and path to each file

touch  abc.txt
find "$directory" -name "*.mp4" -type f -printf "%s bytes\t%TY-%Tm-%Td %TH:%TM:%TS\t%p\n" >> abc.txt

