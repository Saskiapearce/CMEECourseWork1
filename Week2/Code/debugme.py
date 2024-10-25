"""Debugging a peice of code, using a debugger. Debugging is important as it allows """
__appname__ = "debugme"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

def buggyfunc(x): #define the function 
    """    A function that demonstrates a common division error for educational purposes.
    
    This function is intended to show how a division by zero error can occur during iteration.
    The function decreases the value of `y` in a loop and attempts to divide `x` by `y`. When `y` 
    reaches 0, a division by zero error will occur, which is a common mistake in programming.

    Debugging is introduced using `ipdb`, a Python interactive debugger, to help users trace the 
    values of variables (`x`, `y`, and `z`) at each iteration, allowing them to observe the issue 
    when `y` becomes 0 and causes the error. By stepping through the code with `ipdb.set_trace()`, 
    users can follow the execution line-by-line and inspect variable values to understand where 
    and why the error occurs.

    Args:
        x (int): An integer input that serves as both the initial value of `y` and as the numerator 
        for the division.

    Returns:
        z (float): The result of the division `x / y`. However, this function will raise a 
        ZeroDivisionError when `y` becomes 0.
    
    Example:
        >>> buggyfunc(3)
        Traceback (most recent call last):
        ZeroDivisionError: division by zero

    To debug:
        - Uncomment the `ipdb` import and `set_trace()` call.
        - Run the function, and observe how the variables change with each iteration. """
    y = x 
    for i in range(x):
        y = y-1 
        #break in the running of the function, stops at the end of the first iteration 
        #import ipdb; ipdb.set_trace() #iimports a module and sets a break point, runs module by iteration by iteration, you can follow the values by printing c.

        z = x/y
    return z

buggyfunc(20) #start with 20 , 20-19, z = 20/19. 



# you cant devide a number by 0, so an error ocurs 