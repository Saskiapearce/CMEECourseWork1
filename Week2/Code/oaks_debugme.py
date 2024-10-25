#!/usr/bin/env python3
"""Identifies species belonging to the genus Quercus from a CSV file."""

__appname__ = "oaks_debugme"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

import csv
import sys
import doctest
import os

# Define function
def is_an_oak(name):
    """
    Returns True if name starts with 'quercus'

    Examples:
    >>> is_an_oak('Quercus robur')
    True
    >>> is_an_oak('quercus cerris')
    True
    >>> is_an_oak('Quercus petraea')
    True
    >>> is_an_oak('Quercussomething')
    False
    >>> is_an_oak(' Fraxinus excelsior ')
    False
    >>> is_an_oak('Pinus sylvestris')
    False
    >>> is_an_oak('Quercus')  # single word Quercus should be true
    True
    >>> is_an_oak('quercus')  # lowercase, single word Quercus
    True
    >>> is_an_oak('quercus ')  # with trailing space
    True
    """
    oakname = name.lower().strip()
    return oakname == 'quercus' or oakname.startswith('quercus ') 


def main(argv):
    """Processes a CSV file to extract rows containing oak species and writes them to a new CSV file."""
    input_file = '../Data/TestOaksData.csv'
    output_file = '../Results/JustOaksData.csv'

    # Ensure output directory exists
    os.makedirs(os.path.dirname(output_file), exist_ok=True)

    try:
        with open(input_file, 'r') as f:
            with open(output_file, 'w', newline='') as g:
                taxa = csv.reader(f)
                csvwrite = csv.writer(g)
                oaks = set()
                for row in taxa:
                    if len(row) < 2:
                        print("Warning: Skipping malformed row:", row)
                        continue
                    
                    print(f"Processing row: {row}")
                    print("The genus is:", row[0])
                    
                    if is_an_oak(row[0]):
                        print('FOUND AN OAK!')
                        csvwrite.writerow([row[0], row[1]])    

        print(f"Processing complete. Oaks data written to {output_file}")

    except FileNotFoundError:
        print(f" file {input_file} does not exist.")
    except IOError:
        print("An I/O error occurred while processing the files.")
    except Exception as e:
        print(f"Unexpected error: {e}")

    return 0
    
if __name__ == "__main__":
    doctest.testmod()  # Run doctests
    status = main(sys.argv)
