#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: ConcatenateTwoFiles
# Desc: Combines two files, which are inputed, into a new file.
# Arguments: three
# Date: Oct 2 2024

file="../data/$#"
echo "Combinging these files.."
if [ "$#" -ne 3 ]; then
    echo "Put in 1 single file."
else
    cat $1 > $3   # replaced
    cat $2 >> $3 # added
    echo "Merged File is" $3 # Replace tabs with commas and save as .csv
    echo "Done!"
fi
