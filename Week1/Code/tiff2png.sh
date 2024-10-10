#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: tiff2png.sh 
# Desc: Converts a tiff to a png
# Arguments: 1 -> .tif file
# Date: Oct 2 2024

for f in *.tif; # the * makes to so that ANY file with this ending are selected 
    do 
        echo "Converting $f"; # becuase unlike before we dont want to list every single file name 
        convert "$f" "$(basename "$f" . tif).png";
    done 

