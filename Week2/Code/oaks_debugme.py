""" Identifying species that belong to the genus Quercus from a CSV file """
#docstrings are considered part of the running code (normal comments are
#stripped). Hence, you can access your docstrings at run time.
__appname__ = "oaks_debugme"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

import csv #import depednencies for csv input and exports 
import sys
import doctest

#Define function
def is_an_oak(name):
    """
    Returns True if name starts with 'quercus'

    Examples:
    >>> is_an_oak('Quercus robur')
    True
    >>> is_an_oak('Quercus cerris')
    True
    >>> is_an_oak('Quercus petraea')
    True
    >>> is_an_oak('Quercussomething')
    False
    >>> is_an_oak('Fraxinus excelsior')
    False
    >>> is_an_oak('Pinus sylvestris')
    False
    """
    oakname = name.lower().strip()
    return oakname == 'quercus' or oakname.startswith('quercus ') #strip gets rid of spaces before and after the genus name 


def main(argv): 
    """Processes a CSV file to extract rows containing oak species and writes them to a new CSV file."""
    f = open('../Data/TestOaksData.csv','r') #read original input csv 
    g = open('../Results/JustOaksData.csv','w') #write new csv 
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set() #creates new set for matches 
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])    

    return 0
    
if __name__ == "__main__":
    import doctest
    doctest.testmod() #doc test tests the fucntion works above , if the genus names match usisng the test examples 
    status = main(sys.argv)