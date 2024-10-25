#!/usr/bin/env python3
"""Basic python data import and exports, 
prints line if length greater than 0"""
__appname__ = "basic_io1"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

#############################
# FILE INPUT
#############################
# Open a file for reading
with open('../sandbox/test.txt', 'r') as f:
# use "implicit" for loop:
# if the object is a file, python will cycle over lines
    for line in f:      
        print(line)

# close the file
f.close()

# Same example, skip blank lines
with open('../sandbox/test.txt', 'r') as f:
    for line in f: 
        if len(line.strip()) > 0:
            print(line)

f.close()
