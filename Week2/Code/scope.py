#!/usr/bin/env python3
"""demonstartions of variable scopes, 
including local and global variables"""
__appname__ = "scope"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '0.0.1'

#local variables
y = 1
x = 0
for y in range(10):
    x += 1
print(y)
print(x)

i = 1
x = 0

y, x # or print(i, x)
(1, 0)

for y in range(10):
    x += 1
y, x


# x was updated to 10 due to successive simmation that the loop performs and y, which was originally 1 has now become 10 
i = 1
x = 0
def a_function(y):
    x = 0
    for i in range(y):
        x += 1
    return x
a_function(10)
print(i)
print(x)

#this is now a fucntion
i = 1
x = 0
def a_function(y):
    x = 0
    for i in range(y):
        x += 1
    return x

a_function(10)
x =a_function(10)

#global variables 
_a_global = 10 # a global variable

if _a_global >= 5:
    _b_global = _a_global + 5 # also a global variable
    
print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    _a_global = 4 # a local variable
    
    if _a_global >= 4:
        _b_global = _a_global + 5 # also a local variable
    
    _a_local = 3
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)
    
a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)
print("After calling a_function, outside the function, the value of _a_local is ", _a_local)

_a_global = 10

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)

def a_function():
    global _a_global # global makes it modifyed out of the function
    _a_global = 5
    _a_local = 4
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)
    
a_function()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)

def modify_list_1(some_list):
    print('got', some_list)
    some_list = [1, 2, 3, 4]
    print('set to', some_list)

my_list = [1, 2, 3]

print('before, my_life =', my_list)

before, my_list = [1, 2, 3]

modify_list_1(my_list)

print('after, my_list =', my_list)

def modify_list_3(some_list):
    print('got', some_list)
    some_list.append(4) # an actual modification of the list
    print('changed to', some_list)


my_list = modify_list_3(my_list)

print('after, my_life =', my_list)

x = []
for i in range(10):
    x.append(i)
print(x)

x = [i for i in range(10)]
print(x)

x = [i.lower() for i in ["list", "comprehensions", "are", "cool"]]
print
#basically a shortened version of a loop
