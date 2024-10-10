#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: CountLine.sh
# Desc: simple code to count lines in python
# Arguments: one
# Date: Oct 2 2024
#Count lines in a file
NumLines=`wc -l < $1` #redirects the contense of the file to the conmands (wc -l)
echo "The file $1 has $NumLines lines" #print number of lines
echo




