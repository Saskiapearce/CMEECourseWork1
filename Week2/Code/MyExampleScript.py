#!/usr/bin/env python3
"""Creating a function called foo"""
__appname__ = "MyExampleScript"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

#The Python function foo takes a single parameter x, multiplies it by itself (squares it), prints the result, and then returns that squared value.
def foo(x):
     """
    Squares the input value and prints the result.

    This function takes an input `x`, squares it (multiplies it by itself), and prints the result.

    Args:
        x (int or float): The number to be squared.

    Returns:
        None: This function does not return a value; it only prints the result.

    Example:
        >>> foo(2)
        4
        >>> foo(5)
        25
        >>> foo(3.5)
        12.25
    """
     x *= x # same as x = x*x
     print(x)

foo(2)

