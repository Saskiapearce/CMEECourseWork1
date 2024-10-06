#!/bin/bash

#!/bin/bash

cat $1 > $3   # replaced
cat $2 >> $3 # added
echo "Merged File is"
cat $3

#$1 is the way the shell script defines a placeholder for a variable eg the filename 
# assigned $1 as line number 
#the direction of the mouth is the final product 
# eg 1 < 2, 2 is the result

#arguments are placed into the termianal after the file name.
#bash script.sh file1.txt file2.txt merged.txt -> this is what it should look like
