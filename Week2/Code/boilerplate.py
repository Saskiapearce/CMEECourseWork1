#!/usr/bin/env python3
"""A simple boilerplate program which prints, this is a boilerplate """
__appname__ = 'BoilerplateApp'
__author__ = '[Saskia (sp621@ic.ac.uk)]'
__version__ = '3.9'
__license__ = "license for this code/program"

##imports##
import sys # module to interface our profram with the operating system 

## constants ## these do not chnage through the funciton eg PI = 3.14159

##functions ##
def main(argv): #defining a function, argv is the “argument variable”
    """main entry point of the progrom """ 
    print('this is a boilerplate') #prints text 
    return 0 

if __name__ == "__main__": #conditional if command
    """makes sure the 'main' funtion is called from command line"""
    status = main(sys.argv) #directs the interpreter to pass the argument variables to the main function.
    sys.exit(status) #terminate and exit the python program, status = 0 
