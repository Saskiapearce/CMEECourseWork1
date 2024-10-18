#!/usr/bin/env python3
"""Creating a function called foo"""
__appname__ = "MyExampleScript"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '0.0.1'

#The Python function foo takes a single parameter x, multiplies it by itself (squares it), prints the result, and then returns that squared value.
def foo(x): 
    x *= x # same as x = x*x
    print(x)

foo(2)

