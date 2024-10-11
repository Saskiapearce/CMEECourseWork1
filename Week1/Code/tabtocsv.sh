#!/bin/sh
#Author: Saskia sp621@.ic.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas, saving a new file as a csv. The results are saved to the results file
# Arguments: 1 -> tab delimited file
# Date: Oct 2024

# number of files should equal 1
file="../data/$1"
results_folder="../results"

echo "Converting tab file to csv file..." 
if [ "$#" -ne 1 ]; then #
    echo "Put in 1 single file."
    exit 1
fi
# Check if the file has a .tab extension
if [[ "$file" == *.tab ]]; then 
    filename=$(basename "$file" .tab)
    tr -s "\t" "," < "$file" > "$results_folder/${filename}_2.csv"  # Replace tabs with commas and save as .csv
    echo "Done! File saved to $results_folder/${filename}_2.csv"
else
    echo "This is not a .tab file"
fi
