#!/usr/bin/env python3
"""Basic python data import and exports, 
prints line if length greater than 0"""
__appname__ = "basic_io1"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '0.0.1'

#############################
# FILE INPUT
#############################
# Open a file for reading
f = open('../sandbox/test.txt', 'r')
# use "implicit" for loop:
# if the object is a file, python will cycle over lines
for line in f:
    print(line)

# close the file
f.close()

# Same example, skip blank lines
f = open('../sandbox/test.txt', 'r')
for line in f:
    if len(line.strip()) > 0:
        print(line)

f.close()
