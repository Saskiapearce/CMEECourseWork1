#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: variables.sh
# Desc: variables are tested within the script
# Arguments: none
# Date: Oct 2 2024

echo "This script was called with $# parameters"
echo "The script's name is $0" # automatically assigns the filename
echo "The arguments are $@" 
echo "The first argument is $1" #set in the terminal , put after file name (bash variables.sh 1 two)
echo "The second argument is $2"
echo "the third argument is $3" #arguments are set in the terminal 


# Assigned Variables; Explicit declaration: 
MY_VAR='some string' #redefined 
echo 'the current value of the variable is:' $MY_VAR
echo
echo 'Please enter a new string' 
read MY_VAR #like readline, variable is redefined
echo
echo 'the current value of the variable is:' $MY_VAR
echo

## Assigned Variables; Reading (multiple values) from user input: 
echo 'Enter two numbers separated by spaces'
read a b 
echo
echo 'you entered' $a 'and' $b ',their sum is:'

MY_SUM=$(expr $a + $b) #addition of both numbers 
echo $MY_SUM
