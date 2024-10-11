#!/usr/bin/env python3
"""Description of the program or application
you can do this over several lines"""

__appname__ = '[application name here]'
__author__ = '[Saskia (sp621@ic.ac.uk)]'
__version__ = '0.0.1'
__license__ = "license for this code/program"

##imports##
import sys # module to interface our profram with the operating system 

## constants ## these do not chnage through the funciton eg PI = 3.14159

##functions ##
def main(argv): 
    """main entry point of the progrom """
    print('this is a boilerplate')
    return 0 

if __name__ == "__main__": 
    """makes sure the 'main' funtion is called from command line"""
    status = main(sys.argv)
    sys.exit(status)
