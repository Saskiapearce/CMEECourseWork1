a = 1 
type(a) 

a = 2 
type(a)

a = "Two"
type(a)

a = true #Boolean 
type(a)

2 == 2
2 != 2

'hello,' + 'my name is saskia' + str(2)
# yuo can only add a str to a str

x = 5
x + 3

y = 2
x + y 

x = 'my string'
x + 'now has more stuff

x + str(y)

z = '88'

y+ int(z)

# Lists 

Mylist = [3, 2.44, 'green', True]
Mylist[1]
# the list can combine int, float, str and boleens.
# indexing works in the format of [0], [1], [2]...etc 
Mylist[2] = 'blue'
Mylist 
# This has exchanged the 'green' for a 'blue'

Mylist.append('a new item') 
Mylist
# operation adds a new item to the end of the list

%whos
#gives information on the list, the number of items in it. along with a this , x , y and z 
# directory of variables of sorts 

type(Mylist)
#the type is a list

print(type(Mylist))
Mylist

del Mylist[2]
MyTuple = ("a", "b", "c")
print(MyTuple)
type(MyTuple)
MyTuple[0]
(MyTuple[0])
# you cant delete or add, but you can swap
#Tuples are particularly useful when you have sets (pairs, triplets, etc) of items associated with each other that you want to store such that those associations cannot be modified.

FoodWeb  =[('a', 'b'), ('a', 'c'), ('b', 'c'), ('c', 'c')]
FoodWeb 

FoodWeb[0]
FoodWeb[0][0]
FoodWeb[0][0] = "bbb" # wont work as immutable!!
FoodWeb[0] = ("bbb","ccc") 
FoodWeb[0]

# because we want to maintain these associations, no matter
# add
a = (1, 2, [])
# leave a space to add

a[2].append(1000)
a
a[2].append((100,10))
a

#append will be within []
a = (1, 2, 3)
b = a + (4, 5, 6)
b
c = b[1:]
c
b = b[1:]
b

# sets are good because you can create operations on them, they are no duplicates as well

a = [5,6,7,7,7,8,9,9] # list
b = set(a)
b # deleted the repeats, also uses {}

c = set([3,4,5,6])
b & c # intersection of two sets, eg what appears in both 
# 5 and 6 are shared in common

b | c # adds them together 

#a - b
	

#a.difference(b)

#a <= b
	

#a.issubset(b)

#a >= b
	

#b.issubset(a)

#a & b
	

#a.intersection(b)

#a

#b
	

#a.union(b)

# sets are similar to maths sets, with venn diagrams, basically allow you to analysie lists if two are made sets 

# directories 

GenomeSize = {'homo sapiens ': 3200.0, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0}
GenomeSize['Arabidopsis thaliana']#index by name
GenomeSize['Saccharomyces cerevisiae'] = 12.1
GenomeSize
GenomeSize['Escherichia coli'] = 4.6 
GenomeSize 
GenomeSize['Homo sapiens'] = 3201.1
a = [1,2,3]
b = a 
a.append(4)
print(a)
print(b)
a = [1, 2, 3]
b = a[:]
b
a.append(4)
print(a)
print(b)

a = [[1,2], [3,4]]
b = a[:]
print(a)
print(b)

a[0][1]
print(a)
print(b)

import copy 
a = [[1, 2], [3, 4]]
b = copy.deepcopy(a)
a[0][1]=22
print(a)
print(b)

s = " this is a string "
len(s) # length of s -> 18
s.replace(" ","-") # Substitute spaces " " with dashes


#list 
MyList = [3,2.44,'green', True]
MyList.append('23')
MyList

%whos
type(MyList)
print(type(MyList))

del MyList[2]
MyList

MyTuple = ("a", "b", "c")
print(MyTuple)
len(MyTuple)
FoodWeb=[('a','b'),('a','c'),('b','c'),('c','c')]
FoodWeb [0]

a = (1, 2, []) 
a

b = a + (4, 5, 6)
b

c = b[1:]
c

a = ("1", 2, True)
a

a = [5,6,7,7,7,8,9,9]
b = set(a)

b | c #union

a = [1,2,3]
a.append(4)
print(a)
b = a[1:3]
b

#assign as a set
#append only used on list 

import copy

a = [[1, 2], [3, 4]]
b = copy.deepcopy(a)
a[0][1] = 22
print(a)
print(b)

s = " this is a string "
len(s) # length of s -> 18

s.replace("", "-")
s.find("s")
s.upper()
s.lower()

# variable.lower, Veraible.upper. Variable.find]

x = 11
for i in range(x):
    if i > 3: 
        print(i)


for i in range(10):
    print(i)

a = range(10)
a

for i in range(1,6): 
    print(i)

for i in range(2, 10, 3): 
    print(i)

#starting at 2, going to 10, skipping 2

my_iterable = [1,2,3]
type(my_iterable )

my_iterator = iter(my_iterable)
type(my_iterator)
next(my_iterator)

#stops once you have iterested through all your items



for i in range(5):
    print(i)

#0,1,2,3,4

my_list = [0, 2, "geronimo!", 3.0, True, False]
for l in my_list: 
    print(l)

total = 0 
summands = [0, 1, 11, 111, 1111]
for n in summands: 
    total = total + n
    print(total)

#while loop 

z = 0 
while z < 100: 
    z = z + 1
    print(z)

#functions
def foo(x):
    x *= x # same as x = x*x
    print (x)
    return x

%whos

foo(2)

def foo(x):
    x *= x # same as x = x*x
    print (x)
    # return x

y = foo(2)
y


def foo(x):
    x *= x # same as x = x*x
    print(x)

foo(2)
