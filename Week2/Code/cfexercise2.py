#!/usr/bin/env python3
"""Examples of loops and conditionals combined, 
using for and while loops"""
__appname__ = "cfexercise2"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

########################
def hello_1(x): 
    """Prints 'hello' for every multiple of 3 up to the given number, 
    followed by a blank line."""
    for j in range(x):# so youd have to set x
        if j % 3 == 0: 
            print('hello')
    print(' ')

hello_1(12)

########################
def hello_2(x): 
    """
    Prints 'hello' or 'hello2' based on specific conditions for numbers in a range.
    
    Prints 'hello' when the number leaves a remainder of 3 when divided by 5.
    Prints 'hello2' when the number leaves a remainder of 3 when divided by 4.
    """
    for j in range(x):
        if j % 5 == 3:
            print('hello')
        elif j % 4 == 3: 
            print('hello2')
    print()  # This will print a blank line at the end

# Calling the function
hello_2(12)

########################
def hello_3(x, y): 
    """Prints 'hello' for each number in the range between `x` and `y`."""
    for i in range(x, y): 
        print('hello')
    print(' ')


hello_3(40, 100)

########################
def hello_4(x):
    """Prints 'hello' repeatedly until the value of `x` becomes 15."""
    while x != 15: 
        print('hello')
        x = x + 3
    print('')


hello_4(0)

########################
def hello_5(x): 
    """Prints 'hello' based on specific conditions while incrementing `x` until it reaches 100."""
    while x < 100: 
        if x == 31: 
            for k in range(7):
                print('hello')
        elif x == 18: 
            print('hello')
        x = x + 1
    print(' ')

hello_5(1)

#While loop with a break!
def hello_6(x, y): 
    """Prints 'hello!' followed by a number until the value of `y` reaches 6, then breaks the loop"""
    while x: 
        print("hello!" + str(y))
        y += 1 
        if y == 6:
            break
    print(' ')


hello_6 (True, 0)
