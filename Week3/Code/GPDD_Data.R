GPDD <- load("../Data/GPDDFiltered(1).RData")

ls(GPDD)

install.packages("maps") # View the loaded data (replace 'your_data_object' with the actual object name)
# Install and load required packages
if (!require("maps")) install.packages("maps", dependencies = TRUE)
if (!require("mapdata")) install.packages("mapdata", dependencies = TRUE) # Extra map data
library(maps)


# Load the GPDD data
# Replace "path/to" with the actual path to the GPDD data

# Inspect the data structure to locate columns for latitude and longitude
str(GPDD) # Replace 'GPDD' with the actual object name loaded from the .RData file

# Create a world map
map("world", col = "gray90", fill = TRUE, bg = "lightblue", lwd = 0.5)
title("World Map with GPDD Locations") # Add a title to the map

# Extract latitude and longitude columns (adjust column names if necessary)
# Assume `Latitude` and `Longitude` are the column names in the GPDD data
points(gpdd$long, gpdd$lat, col = "red", pch = 20, cex = 0.6)


