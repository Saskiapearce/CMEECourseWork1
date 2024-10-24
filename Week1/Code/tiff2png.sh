#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: tiff2png.sh 
# Desc: Converts a tiff to a png
# Arguments: 1 -> .tif file
# Date: Oct 2024


# first see if there are any tif files in the current wd
# ls lists the tif files, but /dev/null means they are not printed to the terminal 
# 2>&1 suppresses any error messsages 
if ls *.tif 1> /dev/null 2>&1; then  #If .tif files exist, the then block will be executed

    for f in *.tif; do # the * makes to so that ANY file with this ending are selected 
        echo "Converting $f"; #converting input files
        convert "$f" "$(basename"$f" .tif).png"; # renames new file (PNG)
    done

else
    # If no .tif files are found, print this message
    echo "No .tif files found in the directory." #no tif files in directary
fi #finish block

