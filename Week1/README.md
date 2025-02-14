CMEECourseWork

Title: Week 1 Biological Computing Bootcamp

Brief Description:

This repository contains coursework for the Computational Methods in Ecology and Evolution (CMEE), specifically focusing on biological computing tasks using Linux and shell scripting. The exercises are based on TheMulQuaBio course notes (https://mhasoba.github.io/TheMulQuaBio/intro.html) from the Biological Computing course at the Department of Life Sciences, Imperial College London.

Project Structure and Usage: The repository contains code scripts located in the Code folder. The Data folder includes input files used by some scripts, while the sandbox folder contains experimental files and is not essential to the main coursework. Output files are generated in the results folder for this week’s coursework.

Project Structure

    Code folder: Contains all scripts.
    Data folder: Includes input files used by scripts.
    Results folder: Stores output files generated by the scripts.
    Sandbox folder: Used for experimental work (not essential for the coursework).

Languages:

    Linux Shell Scripting (Tested on version 21.3.0)

Dependencies:

    None: All scripts use basic shell commands, which should be available in most Linux distributions.

Installation:

To clone this repository, use the following command:
bash
git clone git@github.com:Saskiapearce/CMEECourseWork.git

Project Structure and Usage:
The repository contains 10 primary scripts located in the Code folder. The Data folder includes input files used by some scripts, while the sandbox folder contains experimental files and is not essential to the main coursework. Output files are generated in the results folder for this week’s coursework.

Overview of the scripts:

Boilerplate.sh

    Purpose: Prints lines of text as a demonstration of shell script syntax.
    Usage: Run the script without arguments.
    Input: None.
    Output: Displays the text "This is a boilerplate".
    Dependencies: None.
    Example: bash Boilerplate.sh
    Output: This is a boilerplate.

variables.sh

    Purpose: Prints a given string and adds two provided numbers.
    Usage: Run the script with a string and two numbers as arguments.
    Input: One string and two numbers.
    Output: Prints the provided string and the sum of the two numbers.
    Dependencies: None.
    Example: bash variables.sh "Hello" 6 7
    Output: Hello, 13

MyExampleScript.sh

    Purpose: Displays a greeting message using a predefined message variable and the current user’s name (environmental variable).
    Usage: Run the script directly.
    Input: No external input; the USER environmental variable is used.
    Output: Prints two greetings with the current user’s name.
    Dependencies: None.
    Example: bash MyExampleScript.sh
    Output:
    Hello <username>
    Hello <username>

tabtocsv.sh

    Purpose: Converts a tab-delimited file to a comma-separated file (CSV) and saves it in the results directory.
    Usage: Run the script with a single .tab file as an argument.
    Input: A tab-delimited .tab file located in the data directory.
    Output: Saves a CSV file in the results directory with _2.csv appended to the original filename.
    Dependencies: None.
    Example: bash tabtocsv.sh example.tab
    Output:
    Converting tab file to csv file...
    Done! File saved to ../results/example_2.csv

CountLine.sh

    Purpose: Counts the number of lines in a specified file located in the data directory.
    Usage: Run the script with a single filename as an argument.
    Input: A single file provided as an argument.
    Output: Displays the number of lines in the specified file.
    Dependencies: None.
    Example: bash CountLine.sh example.txt
    Output: Counting lines in file. The file example.txt has [Number of lines] lines.
    If no file is specified or more than one argument is provided:
    bash CountLine.sh
    Output: Put in 1 single file.

ConcatenateTwoFiles.sh

    Purpose: Merges two specified files into a new file in the results directory.
    Usage: Run the script with three filenames as arguments.
    Input: Three filenames; the first two will be combined and saved under the name of the third.
    Output: The merged file is saved to results.
    Dependencies: None.
    Example: bash ConcatenateTwoFiles.sh file1.txt file2.txt combined.txt

tiff2png.sh

    Purpose: Converts all .tif files in the current directory to .png format.
    Usage: Run the script in a directory containing .tif files.
    Input: One or more .tif files in the current directory.
    Output: .png files with the same base name as the .tif files.
    Dependencies: Requires ImageMagick for the convert command.
    Example: bash tiff2png.sh
    Output: Converting file1.tif
    Converting file2.tif
    (or "No .tif files found in the directory" if none are present)

csvtospace.sh

    Purpose: Converts a comma-delimited CSV file to a space-delimited text file.
    Usage: Run the script with a CSV filename as an argument.
    Input: A .csv file in the data directory.
    Output: A space-delimited .txt file saved in the results directory with _2 appended to the filename.
    Dependencies: None.
    Example: bash csvtospace.sh example.csv
    Output: Converting comma-delimited CSV file to space-delimited ...
    Done! File saved to ../results/example_2.txt

Translate.sh

    Purpose: Performs text transformations, including removing excess spaces, deleting all 'a's, converting text to uppercase, and keeping only numbers.
    Usage: Run the script to apply transformations to predefined text.
    Input: No external input; uses predefined examples.
    Output: Prints transformed text for each example.
    Dependencies: None.
    Example: bash Translate.sh
    Output:
    Remove excess spaces.
    Remove ll the 's
    SET TO UPPERCASE
    10.00 1.33

UnixPrac1.sh

    Purpose: Analyzes FASTA files by counting lines, printing sequences, counting characters, counting "ATGC" sequences, and calculating the AT/GC ratio.
    Usage: Run the script to perform analyses on .fasta files in the data directory.
    Input: One or more .fasta files in the data directory.
    Output:
        Number of lines.
        All sequences from line 2 onward.
        Total number of characters.
        Count of "ATGC" sequences.
        AT/GC ratio.
    Dependencies: Requires grep and bc for text processing and calculations.
    Example: bash UnixPrac1.sh
    Output: Displays line count, sequences, character count, ATGC count, and AT/GC ratio.
    
    Name: Saskia Pearce
    Contact: sp621@ic.ac.uk