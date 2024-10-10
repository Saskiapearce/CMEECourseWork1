CMEECourseWork
Title: Week 1 Biological Computing Bootcamp

Brief Description:

This repository contains coursework for the Computational Methods in Ecology and Evolution (CMEE) module, specifically focusing on biological computing tasks using Linux and shell scripting. The exercises are based on TheMulQuaBio course notes (https://mhasoba.github.io/TheMulQuaBio/intro.html) from the Biological Computing course at the Department of Life Sciences, Imperial College London.

Languages:

    Linux Shell Scripting (Tested on version 21.3.0)

Dependencies:

    None: All scripts use basic shell commands, which should be available in most Linux distributions.

Installation:

To clone this repository, use the following command:
bash
git clone git@github.com:Saskiapearce/CMEECourseWork.git

Project Structure and Usage:
The repository contains 10 primary scripts located in the Code folder. The Data folder includes input files used by some scripts, while the sandbox folder contains experimental files and is not essential to the main coursework. No output is generated in the results folder for this week’s coursework.

Here’s an overview of the scripts:

    Boilerplate.sh:
        Purpose: Prints lines of text as a demonstration of shell script syntax.
        Usage: Run without arguments for sample text output.

    variables.sh:
        Purpose: Prints a given string and adds two provided numbers.
        Usage: Takes one string and two numerical inputs.

    MyExampleScript.sh:
        Purpose: Outputs the current user's name.
        Usage: Run without arguments.

    tabtocsv.sh:
        Purpose: Converts a tab-separated file to a comma-separated values (CSV) file.
        Usage: ./tabtocsv.sh <input.tab>

    CountLine.sh:
        Purpose: Counts the number of lines in a specified file.
        Usage: ./CountLine.sh <file>

    ConcatenateTwoFiles.sh:
        Purpose: Merges two specified files into a new file.
        Usage: ./ConcatenateTwoFiles.sh <file1> <file2>

    tiff2png.sh:
        Purpose: Converts a TIFF image file to PNG format.
        Usage: ./tiff2png.sh <image.tiff>

    csvtospace.sh:
        Purpose: Transforms commas in a CSV file into spaces, outputting a TXT file.
        Usage: ./csvtospace.sh <file.csv>

    Translate.sh:
        Purpose: Demonstrates string manipulation by removing excess spaces, deleting 'a's, and converting text to uppercase.
        Usage: ./Translate.sh <file.txt>

    UnixPrac1.sh:
        Purpose: Analyzes a FASTA file, counts lines, displays lines from the second onwards, calculates sequence length, and finds AT/GC ratios.
        Usage: ./UnixPrac1.sh <file.fasta>

Author Information:

    Name: Saskia Pearce
    Contact: sp621@ic.ac.uk