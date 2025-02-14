"""
This script defines a series of functions (`foo_1` through `foo_6`) that perform various mathematical 
operations, including square root calculation, comparison, sorting, and factorial calculation using 
both iterative and recursive approaches. The script also demonstrates different strategies for solving 
the same problem (factorial calculation), highlighting the key differences between **iterative** and 
**recursive** methods.

The script includes inline tests using Python's `doctest` module to verify the correctness of the functions.
"""

__appname__ = "cfexercise1"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '0.0.1'

import sys
import doctest

x_default = 3
y_default = 13
z_default = 90

def foo_1(x=x_default):
    """
    Calculate the square root of a given number.

    Args:
        x (float or int): The number to find the square root of. Should be non-negative. Default is 3.

    Returns:
        float or int: The square root of x.

    Example:
        >>> foo_1(4)
        2.0
        >>> foo_1(9)
        3.0
        >>> foo_1(16)
        4.0
    """
    return x ** 0.5

def foo_2(x=x_default, y=y_default):
    """
    Calculates and returns the larger of two numbers.
    
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
    """
    Orders 3 numbers in ascending order.

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
    nums = [x, y, z]
    nums.sort()
    return nums

def foo_4(x=x_default):
    """
    Calculates the factorial of an input value using an iterative approach.

    **Iterative Approach**:
    This approach uses a `for` loop to multiply numbers from 1 to x.

    Args:
        x (int): The number to calculate the factorial of. Should be a non-negative integer.
                 Default is 3.

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
    """
    Calculates the factorial of x using a recursive approach.

    **Recursive Approach**:
    This approach breaks the problem into smaller subproblems. It multiplies x by the result of `foo_5(x - 1)`
    until x is reduced to 1, at which point it returns 1 (the base case). This is an example of recursion.

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
    """
    if x == 1:
        return 1
    return x * foo_5(x - 1)

def foo_6(x=x_default):
    """
    Calculates the factorial of x using an iterative approach.

    **Iterative Approach**:
    This approach uses a `while` loop to multiply numbers from x down to 1. It continues until x is less 
    than 1, and then returns the accumulated result.

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
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto

if __name__ == "__main__":  
    doctest.testmod()  # Run all the doctests in the module


