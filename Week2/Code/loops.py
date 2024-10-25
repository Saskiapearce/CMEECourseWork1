#!/usr/bin/env python3
"""
Some simple loops using 'for' and 'while' to demonstrate iteration and accumulation concepts.
This script covers three examples of `for` loops and one example of a `while` loop.
"""

__appname__ = "loops"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

# FOR loops

# Example 1: Simple range-based iteration
for i in range(5):  # The `for` loop iterates over a range from 0 to 4 (5 iterations in total).
    print(i)  # Print the current value of `i` in each iteration.

# Example 2: Iterating over a list with mixed data types
my_list = [0, 2, "geronimo!", 3.0, True, False]  # Define a list with mixed data types.
for k in my_list:  # The `for` loop iterates over each element in `my_list`.
    print(k)  # Print each item in `my_list` to the console.

# Example 3: Accumulating the sum of a list
total = 0  # Initialize the `total` variable to store the cumulative sum.
summands = [0, 1, 11, 111, 1111]  # List of numbers to be added to `total`.
for s in summands:  # The `for` loop iterates over each element in `summands`.
    total = total + s  # Add the current element `s` to the `total`.
    print(total)  # Print the updated total after each addition.

# WHILE loop

# Example 4: Incrementing a counter until a condition is met
z = 0  # Initialize `z` to use as a counter in the loop.
while z < 100:  # The `while` loop continues as long as `z` is less than 100.
    z = z + 1  # Increment `z` by 1 in each iteration.
    print(z)  # Print the current value of `z` after incrementing.
