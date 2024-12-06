
#setwd("~/Documents/CMEECoursework/WeekFinal/code")

library(dplyr)
library(ggplot2)

rm(list=ls())

#Create dataframe
MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")
#dim(MyDF) 
#unique(MyDF$Prey.mass.unit)

#make new prey mass(g) column, where mg is / 1000
MyDF <- MyDF %>%
  mutate(
    Prey.mass.g = ifelse(Prey.mass.unit == "mg", Prey.mass / 1000, Prey.mass)
  )


#Clean up rows with NAs
Clean_data <- MyDF %>%
  group_by(Location, Predator.lifestage, Type.of.feeding.interaction) %>%
  filter(n() > 1, sd(Predator.mass, na.rm = TRUE) > 0) %>%
  ungroup()  # Ungroup to return a clean dataframe





#create regression results from DF
regression_results <- Clean_data %>%
  #group by the 3 fields
  group_by(Location, Predator.lifestage, Type.of.feeding.interaction) %>%
  
  #for each combination, return the intercept, slope, r^2, adjusted r^2 and p_value
  summarize(
    intercept = coef(lm(Prey.mass.g ~ Predator.mass, data = cur_data()))[1],
    slope = coef(lm(Prey.mass.g ~ Predator.mass, data = cur_data()))[2],
    r_squared = summary(lm(Prey.mass.g ~ Predator.mass, data = cur_data()))$r.squared,
    adj_r_squared = summary(lm(Prey.mass.g ~ Predator.mass, data = cur_data()))$adj.r.squared,
    p_value = summary(lm(Prey.mass.g ~ Predator.mass, data = cur_data()))$coefficients[2, 4],
    .groups = "drop"
  )


#Prints and creates CSV file
print(regression_results)
output_file <- "../Results/PP_Regress_Loc_Results.csv"
write.csv(regression_results, file = output_file, row.names = FALSE)

#Complete
print(paste("Linear regression results saved to:", output_file))