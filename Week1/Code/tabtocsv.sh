#!/bin/sh
# Author: Saskia sp621@.ic.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas, saving a new file as a csv. The results are saved to the results file
# Arguments: 1 -> tab delimited file
# Date: Oct 2024

echo "Converting tab file to csv file..." 
if [ "$#" -ne 1 ]; then # check if the value of the variable is not equal to 1
    echo "Put in 1 single file." #print if one signle file is not present
    exit 1
fi
# number of files should equal 1
file="../data/$1" #this is where the input files are pulled from 
results_folder="../results" # results folder to place new files into
filename=$(basename"$file" .tab) #basename is the file name 

if [ ! -f "$file" ]; then #if file is not in the data directory
    echo "Error: The file $file dose not exsit." 
    exit 1
fi

# Check if the file has a .tab extension
if [[ "$file" == *.tab ]]; then 
    if [ -e "$results_folder/${filename}_2.csv" ]; then #see if file already exists in the results folder as to not override the code 
        echo "The file $results_folder/${filename}_2.csv already exists. Conversion skipped." # checks if the file type is a *.tab
    else
        # perform the conversion if the CSV file dose not exist
    echo "Converting tab file to csv file..."
    tr -s "\t" "," < "$file" > "$results_folder/${filename}_2.csv"  # Replace tabs with commas and save as .csv
    echo "Done! File saved to $results_folder/${filename}_2.csv" #shows filepath of the file produced
    fi
else
    echo "This is not a .tab file" #print if not tab file
fi

