#!/bin/sh
#Author: Saskia sp621@.ic.ac.uk
# Script: MyExampleScript.sh
# Description: Shows translation features eg removes excess spaces, removes all the a's, sets text to uppercase 
# Arguments: none
# Date: Oct 2024

echo "Remove     excess      spaces." | tr -s " " #removes all the spaces 
echo "Remove all the a's" | tr -d "a" #removes all the a's
echo "set to uppercase" | tr [:lower:] [:upper:] #sets everything to uppercase
echo "10.00 only numbers 1.33" | tr -d [:alpha:] | tr -s "" "," # only prints numbers
