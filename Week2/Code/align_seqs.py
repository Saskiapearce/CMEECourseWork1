"""Code to align two DNA sequences"""
#docstrings are considered part of the running code (normal comments are
#stripped). Hence, you can access your docstrings at run time.
__appname__ = "align_seqs"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '3.9'

# Two example sequences to match
# takes DNA sequences from csv file 
# saves score into a text file (../Results)
# python align_seq <- input 

#search the csv for sequences, separated by commas

import csv #for inputing and exporting csv

with open('../data/ .csv', 'r') as f: 

    csvread = csv.reader(f)
    sequences = []
    for row in csvread:
        for sequence in row:
            sequences.append(sequence)
            print("DNA sequence:", sequence)

# Assign the longer sequence s1, and the shorter to s2
# l1 is length of the longest, l2 that of the shortest

seq2 = (sequences[0]) #sequence taken from csv file 
seq1 = (sequences[1])

l1 = len(seq1) #assign longested sequence from file 
l2 = len(seq2) 
if l1 >= l2:
    s1 = seq1
    s2 = seq2
else:
    s1 = seq2
    s2 = seq1
    l1, l2 = l2, l1 # swap the two lengths

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)
def calculate_score(s1, s2, l1, l2, startpoint):
    """
    Calculate the alignment score between two DNA sequences starting from a specified position.

    This function aligns a portion of sequence `s2` with sequence `s1` starting at the given 
    `startpoint`. It compares the bases of both sequences, adds to the score if they match, 
    and prints the alignment visually with '*' indicating a match and '-' indicating a mismatch.

    Args:
        s1 (str): The first DNA sequence (usually the longer one).
        s2 (str): The second DNA sequence (usually the shorter one to be aligned with `s1`).
        l1 (int): The length of sequence `s1`.
        l2 (int): The length of sequence `s2`.
        startpoint (int): The starting position in `s1` where the alignment with `s2` begins.

    Returns:
        int: The alignment score representing the number of matching bases between `s1` and `s2`.

    Example:
        >>> calculate_score("AGCTGAC", "GCT", 7, 3, 1)
        .***
        .GCT
        AGCTGAC
        3
    """
    matched = "" # to hold string displaying alignements
    score = 0
    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"

    # some formatted output
    print("." * startpoint + matched)      #startpoitn has to shift up every time       
    print("." * startpoint + s2)
    print(s1)
    print(score) 
    print(" ")

    return score

# Test the function with some example starting points:
# calculate_score(s1, s2, l1, l2, 0)
# calculate_score(s1, s2, l1, l2, 1)
# calculate_score(s1, s2, l1, l2, 5)


results = '../results/alignment_results.txt'

# now try to find the best match (highest score) for the two sequences
my_best_align = None
my_best_score = -1 #alignment will always be higher than this starting score

f = open('../Results/DNA_seq.txt','w')
for i in range(l1): # Note that you just take the last alignment with the highest score
    z = calculate_score(s1, s2, l1, l2, i) #arguement in the file 
    if z > my_best_score:
        my_best_align = "." * i + s2 # think about what this is doing!
        my_best_score = z 
        f.write("Best alignment:\n")
        f.write(f"{my_best_align}\n{s1}\n")
        f.write(f"Best score: {my_best_score}\n")

f.close()

print(my_best_align)
print(s1)
print("Best score:", my_best_score) # best score printed
