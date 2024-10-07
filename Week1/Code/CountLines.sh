#!/bin/bash
#Count lines in a file
NumLines=`wc -l < $1` #redirects the contense of the file to the conmands (wc -l)
echo "The file $1 has $NumLines lines"
echo




