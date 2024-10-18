""" Identifying species that belong to the genus Quercus from a CSV file """
#docstrings are considered part of the running code (normal comments are
#stripped). Hence, you can access your docstrings at run time.
__appname__ = "oaks_debugme"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '0.0.1'

import csv
import sys
import doctest

#Define function
def is_an_oak(name):
    """
    Returns True if name starts with 'quercus '

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
    return name.lower().startswith('quercus ')

def main(argv): 
    f = open('../data/TestOaksData.csv','r')
    g = open('../data/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
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
    doctest.testmod()
    status = main(sys.argv)