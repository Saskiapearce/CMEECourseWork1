# Clear the environment
rm(list = ls())

# Import necessary libraries
require(tidyverse)
require(reshape2)

# Import the data as a matrix (ensures all data is of the same type)
MyData <- as.matrix(read.csv("../Data/PoundHillData.csv", header = FALSE))
class(MyData) # Check class of the data

# Import metadata
MyMetaData <- read.csv("../Data/PoundHillMetaData.csv", header = TRUE, sep = ";")
class(MyMetaData) # Check class of the metadata

# Replace empty strings with 0
MyData[MyData == ""] <- 0

# Transpose the data (flips rows and columns)
MyData <- t(MyData)
head(MyData)

# Assign column names from the first row of MyData
colnames(MyData) <- MyData[1,] 
TempData <- as.data.frame(MyData[-1,], stringsAsFactors = FALSE) # Convert to data frame, excluding the first row
head(TempData)

MyData

# Remove row names
rownames(TempData) <- NULL
head(TempData)

# Reshape the data into long form
MyWrangledData <- melt(TempData, id.vars = c("Cultivation", "Block", "Plot", "Quadrat"), 
                       variable.name = "Species", value.name = "Count")
head(MyWrangledData)
tail(MyWrangledData)

# Correct data types
MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"]) 
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])
str(MyWrangledData)

# Convert to tibble for better handling
MyWrangledData <- dplyr::as_tibble(MyWrangledData)
glimpse(MyWrangledData)

# Filtering data
Count <- filter(MyWrangledData, Count > 100) # Subset rows where Count > 100
Species <- filter(MyWrangledData, Species == "Agrostis gigantea") # Subset rows for specific species

# Slicing the data
slice(MyWrangledData, 10:15) # Select rows from 10 to 15

# Summarise using the pipe operator
MyWrangledData %>%
  group_by(Species) %>%
  summarise(avg = mean(Count, na.rm = TRUE)) # Calculate average count per species, ignoring NA values

# Alternative using aggregate
aggregate(MyWrangledData$Count, by = list(MyWrangledData$Species), FUN = mean)



