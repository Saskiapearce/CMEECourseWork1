#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: CountLine.sh
# Desc: simple code to count lines in python
# Arguments: one
# Date: Oct 2024
#Count lines in a file

file="../data/$1" # pulls file from data folder

echo "Counting lines in file" 
if [ "$#" -ne 1 ]; then # tthe
    echo "Put in 1 single file."
    exit 1
else
    NumLines=$(wc -l < "$file") #redirects the contense of the file to the conmands (wc -l)
    echo "The file $1 has $NumLines lines" #print number of lines
    echo
fi



