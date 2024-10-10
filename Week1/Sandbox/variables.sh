#!/bin/sh
## Illustrates the use off variables 
#species variables 
echo "enter a value"
read $1
echo 

echo "This script was called with $# parameters"
echo "The script's name is $0"
echo "The arguments are $@"
echo "The first argument is $1"
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

MY_SUM=$(expr $a + $b) #dont forget the dollor sign
echo $MY_SUM
