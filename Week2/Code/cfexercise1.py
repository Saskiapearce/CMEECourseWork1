#!/usr/bin/env python3
"""Creating a function called foo and running the function"""
__appname__ = "cfexercise1"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '0.0.1'

#add doc strings to the functions 
#add print at the end of the functions?
#import sys? 
#add pre-defined values 

import sys

x_default = 3; y_default = 13; z_default = 90

def foo_1(x=x_default):
    """ Calculate the square root of a given number

    Args:
        x (float or int): The number to find the square root of. Should be non-negative. Undefined value is 3

    Returns:
        float or int: The square root of x.

    Example:
        >>> foo_1(4)
        2.0
        >>> foo_1(9)
        3.0
    """
    return x ** 0.5


def foo_2(x=x_default, y=y_default):
    """Calculates and returns the larger of two numbers.
    Args: 
        x (float or int): The first number. Default is 3.
        y (float or int): The second number. Default is 13.

    Returns:
        float or int: The larger of x and y.

    Example:
        >>> foo_2()
        13
        >>> foo_2(10, 5)
        10
        >>> foo_2(7, 14)
        14
    """
    return x if x > y else y

def foo_3(x=x_default, y=y_default, z=z_default):
    """ Orders 3 numbers in ascending order 

    Args:
        x (int or float): The first number, default is 3.
        y (int or float): The second number, default is 13.
        z (int or float): The third number, default is 90.

    Returns:
        list: A list of the three numbers sorted in ascending order.

    Example:
        >>> foo_3()
        [3, 13, 90]
        >>> foo_3(15, 5, 10)
        [5, 10, 15]
        
    """
    if x > y:
        tep = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    return [x, y, z]



def foo_4(x=x_default):
    """ Calculates the fractorial of an input value 

    Args:
        x (int): The number to calculate the factorial of. Should be a non-negative integer.
                 Default is 5.

    Returns:
        int: The factorial of x.

    Example:
        >>> foo_4(5)
        120
        >>> foo_4(3)
        6
    """
    result = 1
    for i in range(1, x + 1):
        result = result * i
        return result 

def foo_5(x=x_default):
    """ Calculates the fractorial of x

    Args:
    x (int): The number to calculate the factorial of. Should be a non-negative integer.
                 Default is 3.

    Returns:
        int: The factorial of x.
        
    Example:
        >>> foo_5(5)
        120
        >>> foo_5(3)
        6
        
    """ # a recursive function that calculates the factorial of x
    if x == 1:
        return 1
    return x * foo_5(x - 1)
     
def foo_6(x=x_default):
    """ Calculates the fractorial of x

    Args:
    x (int): The number to calculate the factorial of. Should be a non-negative integer.
    Default is 3.

    Returns:
        int: The factorial of x.
        
    Example:
        >>> foo_6(5)
        120
        >>> foo_6(3)
        6
    """ 
     # Calculate the factorial of x in a different way; no if statement involved
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto

if (__name__ == "__main__"): # If the script is imported as a module in another script, __name__ is set to the module’s name instead.
    status = main(sys.argv) # brings calls the funtion main and passed it to sys.argv, to look for inputted elements
    sys.exit(status)



