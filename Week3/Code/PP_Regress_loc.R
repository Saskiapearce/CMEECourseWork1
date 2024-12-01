rm(list=ls())

data <- read.csv("../Data/EcolArchives-E089-51-D1.csv")
data$Type.of.feeding.interaction <- as.character(data$Type.of.feeding.interaction)
#instal packages
#install.packages("ggplot2")
require(ggplot2)
require(plyr)
# qplot(log(Prey.mass), log(Predator.mass), data = data, colour = Type.of.feeding.interaction)

# Define regression function with additional checks
Regression <- function(subset_data) {
  if (nrow(subset_data) > 1 && length(unique(subset_data$Prey.mass)) > 1 && length(unique(subset_data$Predator.mass)) > 1 && length(unique(subset_data$Location)) > 1) {
    # Perform linear regression
    model <- lm(Predator.mass ~ Prey.mass, data = subset_data)
    model_summary <- summary(model)
    
    # Return regression statistics as a data frame
    return(data.frame(
      Slope = model_summary$coefficients[2, 1],
      Intercept = model_summary$coefficients[1, 1],
      R_Squared = model_summary$r.squared,
      P_Value = model_summary$coefficients[2, 4],
      F_Statistic = model_summary$fstatistic[1],
      Predictor = paste(
        unique(subset_data$Type.of.feeding.interaction),
        unique(subset_data$Predator.lifestage),
        unique(seubset_data$Location)
        sep = " - "
      )
    ))
  } else {
    return(NULL) # Skip subsets with insufficient or constant data
  }
}

# Apply Regression function to each group using ddply
regression_results <- ddply(data, .(Type.of.feeding.interaction, Predator.lifestage, Location), Regression)

# Filter out NULL rows
regression_results <- do.call(rbind, Filter(Negate(is.null), regression_results))
regression_results <- t(regression_results)
head(regression_results)

regression_results
# Write results to CSV
write.csv(regression_results, "../results/PPP_Regress_Results.csv", row.names = FALSE)

