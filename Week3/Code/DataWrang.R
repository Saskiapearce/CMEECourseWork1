#importing a dataframe and data wrangling it 
# imported as a matrix (so all data is a string)
# using matrix makes everythign a consistant data type
MyData <- as.matrix(read.csv("../data/PoundHillData.csv", header = FALSE))
class(MyData)

MyMetaData <- read.csv("../data/PoundHillMetaData.csv", header = TRUE, sep=";")
class(MyMetaData)

MyData[MyData == ""] = 0 # we can do this because the data is true zero (absences of species) 

MyData <- t(MyData) #Transposition (t() function):
#The t() function in R takes a matrix or a data frame and transposes it. Transposing means flipping the rows and columns of the data.
head(MyData) #makes it so that months are all in one column , rather then in multiple rows 

colnames(MyData)
MyData

colnames(TempData) <- MyData[1,] # assign column names from original data
head(TempData)

TempData <- as.data.frame(MyData[-1,],stringsAsFactors = F) #stringsAsFactors = F is important here because we don’t want R to convert columns to the factor class
head(TempData)  

rownames(TempData) <- NULL #gets rid of row names which are particularly important
head(TempData)

TempData

#name we can make the data long form 
MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")
head(MyWrangledData); tail(MyWrangledData)
MyWrangledData

#now that the data is corrected, we can assign the correct data types 
MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])
str(MyWrangledData)

MyWrangledData
require(tidyverse)

tidyverse_packages(include_self = TRUE) # the include_self = TRUE means list "tidyverse" as well 


MyWrangledData <- dplyr::as_tibble(MyWrangledData) #:: allows you to access a particular function (like a python module)
MyWrangledData
class(MyWrangledData)

glimpse(MyWrangledData) # a nice formatted overveiw of the data 


# filtering the data
Count <_ filter(MyWrangledData, Count>100) #like subset(), but nicer!
Species <- filter(MyWrangledData, Species == "Agrostis gigantea") #subsets for these speices 

# slicing the data
slice(MyWrangledData, 10:15) # Look at a particular range of data rows

# pipe operator , which allows you to create a compact sequence of manioutates in yoru data set , needed dplyr

MyWrangledData %>%
  group_by(Species) %>%
  summarise(avg = mean(Count)) #average of each species (this is a really cool function i love this)

aggregate(MyWrangledData$Count, list(MyWrangledData$Species), FUN=mean)




