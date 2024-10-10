#!/bin/sh
#Author: Saskia sp621@.ic.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas, saving a new file as a csv
# Arguments: 1 -> tab delimited file
# Date: Oct 2024

# Check if the number of arguments is exactly 1
file="../data/$1"
echo "Converting tab file to csv file..." 
if [ "$#" -ne 1 ]; then #
    echo "Put in 1 single file."
    exit 1
fi
# Check if the file has a .tab extension
if [[ "$file" == *.tab ]]; then 
    tr -s "\t" "," < "$file" > "${file%.tab}.csv"  # Replace tabs with commas and save as .csv
    echo "Done!"
else
    echo "This is not a .tab file"
fi

