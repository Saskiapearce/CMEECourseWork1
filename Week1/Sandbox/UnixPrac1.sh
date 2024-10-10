#Count how many lines in each file  
NumLines=`wc -l < $1` #redirects the contense of the file to the commands (wc -l)
echo "The file $1 has $NumLines lines"
echo
echo "line [{2}-]"

