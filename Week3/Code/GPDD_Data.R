# GPDD_Data.R
# Script to visualize GPDD data on a world map

# Load necessary packages
install.packages("maps")

library(maps)

# Load GPDD data
# Note: Replace the file path with the actual location of the GPDD dataset
load("../Data/GPDDFiltered(1).RData")


# Create a world map
map("world", col = "lightgray", fill = TRUE, bg = "lightblue", mar = c(0, 0, 0, 0))

# Superimpose GPDD locations
points(gpdd$long, gpdd$lat, col = "red", pch = 100, cex = 0.6)

# Add title
title("Locations of GPDD Data", line = 2)

# Save plot as an image
dev.copy(png, filename = "../Results/GPDD_Map.png")
dev.off()

# Biases - geographical bias' due to varying reasons has resulted in the neglect of the southern hemispheres, which can result in a 
# latitudinal bias, which potentially may have consquences for the type of habitats avaiable. 

# These biases should be considered when interpreting results and may require
# additional data collection or statistical adjustments.
