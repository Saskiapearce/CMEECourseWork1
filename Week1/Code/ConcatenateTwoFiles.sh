#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: ConcatenateTwoFiles
# Desc: Combines two files, which are inputed, into a new file.
# Arguments: three
# Date: Oct 2 2024

data_folder="../data"
results_folder="../results"

# Check if three arguments are provided
if [ "$#" -ne 3 ]; then
    echo "You must provide exactly 3 arguments."
    echo "The first two files will be combined into the third file name."
    exit 1
else
    # Define input and output file paths
    input_file1="$data_folder/$1"
    input_file2="$data_folder/$2"
    output_file="$results_folder/$3"
    # Combine the files into the output file in the results folder
    cat "$input_file1" "$input_file2" > "$output_file"
 
    echo "Merged File is $output_file"
    echo "Done!"
fi


