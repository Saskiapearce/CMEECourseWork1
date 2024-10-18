"""Debugging a peice of code, using a debugger"""
__appname__ = "debugme"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

def buggyfunc(x): #define the function 
    """This function has an error when y reaches 0
    default value """
    y = x 
    for i in range(x):
        y = y-1 
        #break in the running of the function, stops at the end of the first iteration 
        #import ipdb; ipdb.set_trace() #iimports a module and sets a break point, runs module by iteration by iteration, you can follow the values by printing c.

        z = x/y
    return z

buggyfunc(20) #start with 20 , 20-19, z = 20/19. 



# you cant devide a number by 0, so an error ocurs 