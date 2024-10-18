""" Using Dictionaries """
__appname__ = "Dictionary"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

taxa = { ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
         }



taxa_dic = {} # create an empty dictionary to add to

# Populate taxa_dic with orders mapped to sets of species
for species, order in taxa:
    if order not in taxa_dic:
        taxa_dic[order] = set()  # Create a set for this order if it doesn't already exist
    taxa_dic[order].add(species)  # Add the species to the appropriate order set

# Print the resulting dictionary
for order, species_set in taxa_dic.items():
    print("\n" f"'{order}': {species_set}")



taxa_dic = {order: {species for species, o in taxa if o == order} for _, order in taxa}

# Print the resulting dictionary
for order, species_set in taxa_dic.items():
    print("\n" f"'{order}': {species_set}")
 

