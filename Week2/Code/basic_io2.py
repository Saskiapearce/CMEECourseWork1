"""Basic python data import and exports, 
saving the elements of a list to a file"""
__appname__ = "basic_io2"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

#############################
# FILE OUTPUT
#############################
# List to be saved to a file
list_to_save = range(100)

# Use "with open()" for safer file handling
with open('../sandbox/testout.txt', 'w') as f: #handles the file opening and closely safetly
    for i in list_to_save:
        f.write(str(i) + '\n')  # Write each item in the list followed by a new line
