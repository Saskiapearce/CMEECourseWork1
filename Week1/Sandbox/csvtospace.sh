
#IF TYPE = CSV IF IT IS PROCEED IF NOT WAIT 
#!/bin/bash

echo "Creating a comma delimited version of $1 ..."
if [[ "$1" == *.csv ]]; then 
        cat "$1" | tr -s "," " " >> "${1}_2".txt;
        echo "Done!"
else
        echo "This is not a csv"
fi

#echo "Creating a comma delimited version of $1 ..."
#cat $1 | tr -s "," " " >> FILE2.txt
#echo "Done!"
#exit
