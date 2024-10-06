#!/bin/bash

for f in *.tif; # the * makes to so that ANY file with this ending are selected 
    do 
        echo "Converting $f"; # becuase unlike before we dont want to list every single file name 
        convert "$f" "$(basename "$f" . tif).png";
    done 

