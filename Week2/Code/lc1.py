""" Comprehensions and lists """
__appname__ = "lc1"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'


birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively.
# List comprehension to extract Latin names
Latin = [i[0] for i in birds] #the first values taken from the list 

# List comprehension to extract common names
Common = [i[1] for i in birds]

# List comprehension to extract mean body masses
Mass = [i[2] for i in birds]

# Print the lists
print("Latin names:", Latin)
print("Common names:", Common)
print("Masses:", Mass)

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

latin = [] #create new empty list 
common = []
Mass = []

for bird in birds: 
    latin.append(bird[0]) #add values to the list 
    common.append(bird[1])
    Mass.append(bird[2])

print("Latin names:", latin) #print result 
print("Common names:", common)
print("Masses:", Mass)

