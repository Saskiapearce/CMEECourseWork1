"""Using R data types """
__appname__ = "R basics"
__author__ = 'Saskia Pearce (sp621@imperial.ac.uk)'
__version__ = '0.0.1'


ls() #list all the variables in a work space 
rm('a', 'b') # remove variables a and b 
rm(list-ls()) #remove all variables 
getwd # get working dircetor 
setwd #set working directory 
q() #quit R

a <- 4 # store 4 as a veriable 
a # display it 

a * a # product 
a_squared <- a * a # assigning a new variable
sqrt(a_squared)
v <- c(0, 1, 2, 3, 4) 
v # Display the vector-valued variable you created 

is.vector(v) # check if v's a vector 

mean(v) #mean of v 

var(v)

median(v)

sum(v) # adds up all elements 

prod(v + 1) #multiplys all elements 

length(v) # how many elements in the vector 

# variable lengths 

wing.width.cm <- 1.2 #using dot notation 
wing.length.cm <- c(4.7, 5.2, 4.8)
wing.length.cm 

x <- (1+(2*3)) 
x

f(3,4) #calling a function with the arguments 3 & 4 

a + (b+c) #to enforce order over which statements or calculation are executed

{expr1; expr2; expr3} # groyp a set of expression or commands into one compound expression 

x[4] # fouth element of a vector 

li[[3]] # get the 3rd element of some list li and retrun it 

li = list(c(1,2,3)) #just c = vector, list has to be defined 
class(li)

b <- 5/0

is.infinite(b)

is.finite(0/0)

as.integer(3.1)

#this is really cool 
as.roman(155)
as.roman(10)
as.roman(13)
as.roman(3099) #MMMXCIX

#Vectors 

a <- 5
is.vector(a)

v1 <- c(0.02, 0.5, 1)
v2 <- c("a", "b", "def", "isgd")
v3 <- c(TRUE, TRUE, FALSE)

v1;v2;v3

v1 <- c(0.02, TRUE, 1)
v1

mat1 <- matrix(1:25, 5, 5, byrow=TRUE)
mat1

arr1 <- array(1:50, c(5, 5, 2))
arr1[,,1]

print(mat1)

dim(mat1)

arr1 <- array(1:50, c(5, 5, 2))
arr1[,,1]

print(arr1)

arr1[,,2] 

mat1[1,1] <- "one"
matrix #changed the matrix to a string type...

MyList <- list(1L, "p", FALSE, .001)
MyList 

MyList <- list(species=c("Quercus robur", "Fraxinus execlsior"), age=c(123, 84))
MyList 

MyList[[1]]

MyList[[1]][[1]]

MyList$species
MyList[["species"]]

pop1 <- list(species='Cancer magister',
           latitude=48.3,longitude=-123.1,
           startyr=1980,endyr=1985,
           pop=c(303,402,101,607,802,35))
pop1

pop1$species
pop1$longitude

pop1<-list(lat=19,long=57,
           pop=c(100,101,99))
pop2<-list(lat=56,long=-120,
           pop=c(1,4,7,7,2,1,2))
pop3<-list(lat=32,long=-10,
           pop=c(12,11,2,1,14))
pops<-list(sp1=pop1,sp2=pop2,sp3=pop3)
pops

pop1$pop
pops$sp1["pop"] # sp1's population sizes

Col1 <- 1:10
Col1
Col2 <- LETTERS[1:10] #ACBDEFGHIJ
Col2

Col3 <- runif(10) # 10 random numbers from a uniform distribution
Col3

MyDF <- data.frame(Col1, Col2, Col3) #making a dataframe 
MyDF

print(MyDF)

names(MyDF) <- c("MyFirstColumn", "My Second Column", "My.Third.Column") #how to name the columns on the data set 
MyDF

MyDF$MyFirstColumn
colnames(MyDF)

colnames(MyDF) [2] <- "my second column"

MyDF$My.Third.column

class(MyDF)
str(MyDF)

head(MyDF)
tail(MyDF)

MyMat <- matrix(1:8, 4, 4)
MyMat

MyDF <- as.data.frame(MyMat)
MyDF

object.size(MyMat)
object.size(MyDF)

#creating and manipulating data 

years <- 1900:2009
years

years <- 2009:1990
years

seq(1, 10, 0.5) #start at one, end at 10, increading in 0.5 intervals 
seq(from=1, to=10, by=0.5)

MyVar <- c( 'a','b','c','d','e')
MyVar[1]

MyVar[c(3,2,1)]

MyVar[c(1,1,1,5,5)]

#mainpute data stuctures / objects by indexing 

v <- c(0, 1, 2, 3, 4)
v[3]

v[1:3]
v[-3] #removes the elememt 

v[c(1, 4)] # access non sequenctial elements 

mat1 <- matrix(1:25, 5, 5, byrow=TRUE)
mat1

mat1[1:2,2:4]

mat[1, ] #first row , all columns 
mat[ ,1] #first colum, all rows 

v <- c(0, 1, 2, 3, 4, 5)
v2 <- v*2
v2

species.name <- "quercus robur"
species.name

paste("Quercus", "robur")

paste("Quercus", "robur",sep = "")

paste(species.name,sep = ", ")

paste("year is:", 1990:2000)


#manipulting strings 

strsplit(x,';')

Split the string x at ‘;’

nchar(x)
	

Number of characters in string x

toupper(x)
	

Set string x to upper case

tolower(x)
	

Set string x to lower case

paste(x1,x2,sep=';')
	

Join the two strings using ‘;’

setwd("/Users/student/Documents/CMEECourseWork1/Week3/Code")
dir()