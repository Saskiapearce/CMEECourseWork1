#!/bin/sh
# Author: Saskia sp621@.ic.ac.uk
# Script: MyExampleScript.sh
# Description: prints the name of the user
# Arguments: none
# Date: Oct 2024

MSG1="Hello" #setting first variable
MSG2=$USER #user is an example of environemtnal variable, which cant change
echo "$MSG1 $MSG2" # "Hello, user"
echo "Hello $USER" # print user name 
echo 