#!/usr/bin/env python3
"""A  program which assigns a name to a module using __name__ """
__appname__ = 'Using_name'
__author__ = '[Saskia (sp621@ic.ac.uk)]'
__version__ = '3.9'
__license__ = "license for this code/program"

#Filename: using_name.py
if __name__ == '__main__': #special built-in variable (__name__), meaning python knows if a file is being imported to another file or run directly 
    print('the program is being run by itself !')
else: 
    print('I am being imported from another script/program/module!')

print("this module's name is: " + __name__) 

