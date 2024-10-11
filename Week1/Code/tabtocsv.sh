#!/bin/sh
#Author: Saskia sp621@.ic.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas, saving a new file as a csv. The results are saved to the results file
# Arguments: 1 -> tab delimited file
# Date: Oct 2024

# number of files should equal 1
file="../data/$1" #this is where the input files are pulled from 
results_folder="../results" # c results folder to place new files into

echo "Converting tab file to csv file..." 
if [ "$#" -ne 1 ]; then # check if the value of the variable is not equal to 1
    echo "Put in 1 single file."
    exit 1
fi
# Check if the file has a .tab extension
if [[ "$file" == *.tab ]]; then # checks if the file type is a *.tab
    filename=$(basename "$file" .tab) # creates the filename as a basename 
    tr -s "\t" "," < "$file" > "$results_folder/${filename}_2.csv"  # Replace tabs with commas and save as .csv
    echo "Done! File saved to $results_folder/${filename}_2.csv"
else
    echo "This is not a .tab file" #print if not tab file
fi
