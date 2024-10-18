#!/usr/bin/env python3
"""A  program which uses the argv agrument variable to uphol arguemtns passed in the script when run """
__appname__ = 'sysargv'
__author__ = '[Saskia (sp621@ic.ac.uk)]'
__version__ = '3.9'

import sys 
#imput, %run sysargv.py var1 var2
print("this is the name of the script: ", sys.argv[0]) #the first argument is printed, the name of the program
print("Number of arguments: ", len(sys.argv)) #3 arguements 
print('the arguments are: ', str(sys.argv)) # file name, var1 and var2

