#!/bin/sh
# Author: Saskia Pearce sp621@imperial.ac.uk
# Script: csvtospace.sh
# Desc: Practical assessment 2, tranlates commas to spaces, creating a in a txt file from a CSV
# Arguments: 1 -> comma delimited file
# Date: Oct 2024

file="../data/$1" # pulls file from data folder
results_folder="../results" # specify the output folder

echo "Converting comma-delimited CSV file to space-delimited ..." 
if [[ "$file" == *.csv ]]; then 
        # Extract filename without the directory
        filename=$(basename "$file" .csv) # removes the .csv from the final file name
        
        # Convert the file and place it in the results folder
        tr -s "," " " < "$file" > "$results_folder/${filename}_2.txt" # puts file into results folder with the base name and a new .txt
        
        echo "Done! File saved to $results_folder/${filename}_2.txt"
else
        echo "This is not a csv" # print text if not a csv
fi
