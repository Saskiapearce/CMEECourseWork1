""" Comprehensions and lists """
__appname__ = "lc2"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
rain = [(month, amount) for month, amount in rainfall if amount >100]
print(rain) #pinrts rainfall over 100 mm

 
# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

rain = [(month, amount) for month, amount in rainfall if amount <50]
print(rain) #prints rain fall less than 50 mm

 

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

rain100 = []

for month, amount in rainfall: 
    if amount>100:
        rain100.append((month, amount)) #add to new empty rain100 list 

print(rain100)

rain50 = []

for month, amount in rainfall: 
    if amount<50:
        rain50.append((month, amount)) #add to new empty rain100 list 

print(rain50)
    

# A good example output is:

#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.