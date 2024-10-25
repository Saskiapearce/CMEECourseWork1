#!/usr/bin/env python3
# scope.py
"""Demonstrations of variable scopes, including local and global variables"""

__appname__ = "scope"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

# Local variable example
y = 1
x = 0
for y in range(10):
    x += 1
print("Final values after loop - y:", y, "x:", x)  # Outputs: y: 9, x: 10

# Using a function with local variables
i = 1
x = 0

def a_function(y):
    local_x = 0
    for i in range(y):
        local_x += 1
    return local_x

print("Output of a_function(10):", a_function(10))
print("Global i:", i, "Global x:", x)  # i remains 1, x remains 0 as they were not modified by a_function

# Global variable example
_a_global = 10

if _a_global >= 5:
    _b_global = _a_global + 5  # Also a global variable

print("Before calling a_function, the value of _a_global is", _a_global)
print("Before calling a_function, the value of _b_global is", _b_global)

def a_function_scope():
    _a_global = 4  # A local variable within this function
    if _a_global >= 4:
        _b_global = _a_global + 5  # Local within function
    _a_local = 3
    
    print("Inside a_function_scope, _a_global is", _a_global)
    print("Inside a_function_scope, _b_global is", _b_global)
    print("Inside a_function_scope, _a_local is", _a_local)
    
a_function_scope()

print("After calling a_function_scope, the value of _a_global is", _a_global)
print("After calling a_function_scope, the value of _b_global is", _b_global)
# _a_local is not accessible here, so we avoid trying to print it outside the function

# Modifying a global variable inside a function
_a_global = 10
print("Before calling modify_global, the value of _a_global is", _a_global)

def modify_global():
    """This function modifies the global variable _a_global."""
    global _a_global
    _a_global = 5
    _a_local = 4
    
    print("Inside modify_global, _a_global is", _a_global)
    print("Inside modify_global, _a_local is", _a_local)

modify_global()

print("After calling modify_global, the value of _a_global now is", _a_global)

# Demonstrating list modification inside a function
def modify_list_reassign(some_list):
    """Reassigns a list inside the function, which does not modify the original list."""
    print('Got list:', some_list)
    some_list = [1, 2, 3, 4]
    print('List reassigned to:', some_list)

my_list = [1, 2, 3]
print("Before modify_list_reassign, my_list =", my_list)
modify_list_reassign(my_list)
print("After modify_list_reassign, my_list =", my_list)

def modify_list_append(some_list):
    """Appends to the original list, demonstrating modification by reference."""
    print('Got list:', some_list)
    some_list.append(4)
    print('List after append:', some_list)

modify_list_append(my_list)
print("After modify_list_append, my_list =", my_list)

# List comprehensions
x = [i for i in range(10)]
print("List comprehension result:", x)

lowercase_list = [i.lower() for i in ["List", "Comprehensions", "Are", "Cool"]]
print("Lowercased list comprehension result:", lowercase_list)
