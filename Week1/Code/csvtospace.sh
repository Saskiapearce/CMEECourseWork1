#!/bin/sh
# Author: Saskia Pearce sp621@imperial.ac.uk
# Script: csvtospace.sh
# Desc: Practical assessment 2, tranlates commas to spaces, creating a in a txt file from a CSV
# Arguments: 1 -> comma delimited file
# Date: Oct 2024

file="../data/$1" # pulls file from data folder
echo "Converting comma-delimited CSV file to space-delimited ..." 
if [[ "$file" == *.csv ]]; then 
        tr -s "," " " < "$file" > "${file}_2.txt"  # only converts it if file is a csv
        echo "Done!" 
else
        echo "This is not a csv" # print text if not a csv
fi

