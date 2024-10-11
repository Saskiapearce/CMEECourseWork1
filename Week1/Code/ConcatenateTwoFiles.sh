#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: ConcatenateTwoFiles
# Desc: Combines two files, which are inputed, into a new file.
# Arguments: three
# Date: Oct 2024

data_folder="../data" # access a data file from the data folder
results_folder="../results" # sets a folder to send the results 

# Check if three arguments are provided
if [ "$#" -ne 3 ]; then # sees if the number of files is equal to 3
    echo "You must provide exactly 3 files, the first two are combined under the name of the third file." # printed
    exit 1
else
    # Define input and output file paths
    input_file1="$data_folder/$1" # assigns the arguments to specific files
    input_file2="$data_folder/$2" 
    output_file="$results_folder/$3"
    # Combine the files into the output file in the results folder
    cat "$input_file1" "$input_file2" > "$output_file" # adds files 
 
    echo "Merged File is $output_file"
    echo "Done!"
fi


