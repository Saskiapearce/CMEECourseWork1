#!/usr/bin/env python3
"""Examples of loops and conditionals combined, 
using for and while loops"""
__appname__ = "cfexercise2"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

########################
def hello_1(x): 
    """    Prints 'hello' for every multiple of 3 up to the given number `x`.
    
    Loop Explanation:
    - A `for` loop iterates from 0 to `x-1`.
    - For each iteration, the current number `j` is checked if it is divisible by 3 (`j % 3 == 0`).
    - If divisible by 3, it prints 'hello'.
    - The loop runs `x` times in total, checking each number from 0 to `x-1`."""
    for j in range(x):# so youd have to set x
        if j % 3 == 0: 
            print('hello')
    print(' ')

hello_1(12)

########################
def hello_2(x): 
    """
    Prints 'hello' or 'hello2' based on specific conditions for numbers in a range.
    
    Loop Explanation:
    - A `for` loop iterates from 0 to `x-1`.
    - For each number `j`, two conditions are checked:
        - If the remainder of `j` divided by 5 is 3 (`j % 5 == 3`), it prints 'hello'.
        - If the remainder of `j` divided by 4 is 3 (`j % 4 == 3`), it prints 'hello2'.
    - Only one condition is evaluated for each `j` due to the `elif`."""
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
    """    Prints 'hello' for each number in the range between `x` and `y`.
    
    Loop Explanation:
    - A `for` loop iterates over the range from `x` to `y-1`.
    - In each iteration, it prints 'hello'.
    - The loop runs `(y - x)` times, meaning if `x` is 40 and `y` is 100, it will print 'hello' 60 times."""
    for i in range(x, y): 
        print('hello')
    print(' ')


hello_3(40, 100)

########################
def hello_4(x):
    """    Prints 'hello' repeatedly until the value of `x` becomes 15.
    
    Loop Explanation:
    - A `while` loop runs as long as `x` is not equal to 15.
    - Each time through the loop, 'hello' is printed, and `x` is incremented by 3.
    - The loop terminates when `x` becomes 15."""
    while x != 15: 
        print('hello')
        x = x + 3
    print('')


hello_4(0)

########################
def hello_5(x): 
    """ Prints 'hello' based on specific conditions while incrementing `x` until it reaches 100.
    
    Loop Explanation:
    - A `while` loop runs as long as `x` is less than 100.
    - Two conditions are checked within the loop:
        - If `x == 31`, it prints 'hello' 7 times by using an inner `for` loop.
        - If `x == 18`, it prints 'hello' once.
    - After each iteration, `x` is incremented by 1.
    - The loop terminates when `x` reaches 100."""
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
    """ Prints 'hello!' followed by a number until the value of `y` reaches 6, then breaks the loop.
    
    Loop Explanation:
    - A `while` loop runs indefinitely as long as `x` is true (non-zero, non-empty, or not False).
    - In each iteration, it prints 'hello!' followed by the value of `y`, then increments `y` by 1.
    - If `y` becomes 6, the `break` statement is triggered, exiting the loop early."""
    while x: 
        print("hello!" + str(y))
        y += 1 
        if y == 6:
            break
    print(' ')


hello_6 (True, 0)
