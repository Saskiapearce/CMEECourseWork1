export PATH=$PATH:$HOME/.local/bin
#!/bin/sh
# Author: Saskia sp621@imperial.ac.uk
# Script: boilerplate.sh
# Desc: simple boilerplate for shell scripts
# Arguments: none
# Date: Oct 2 2024

echo -e "\nThis is a shell script! \n"
echo -e "\nThis is a line of text! \n"
echo -e "\n This is also an additional line of text... hello! \n"

#exit

MY_VAR=10
read MY_VAR
MY_VAR=$( (ls | wc -l) )
echo -e MY_VAR

