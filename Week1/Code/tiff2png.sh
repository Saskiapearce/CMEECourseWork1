#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: tiff2png.sh 
# Desc: Converts a tiff to a png
# Arguments: 1 -> .tif file
# Date: Oct 2024

for f in *.tif; # the * makes to so that ANY file with this ending are selected 
    do 
        echo "Converting $f"; 
        convert "$f" "$(basename "$f" . tif).png"; # renames new file (PNG)
    done 

