rm(list=ls())

data <- read.csv("../Data/EcolArchives-E089-51-D1.csv")
data$Type.of.feeding.interaction <- as.character(data$Type.of.feeding.interaction)
#instal packages
#install.packages("ggplot2")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
if (!requireNamespace("plyr", quietly = TRUE)) install.packages("plyr")
library(plyr)
library(ggplot2)


# qplot(log(Prey.mass), log(Predator.mass), data = data, colour = Type.of.feeding.interaction)

ggplot(data, aes(x = Prey.mass, y = Predator.mass, color = Predator.lifestage)) +
  geom_point(shape = 3) +
  geom_smooth(method = "lm", se = TRUE, fullrange = TRUE) +
  scale_x_log10() +  # Log scale for x-axis
  scale_y_log10() +  # Log scale for y-axis
  labs(x = "Prey Mass in grams", y = "Predator Mass in grams") +
  facet_wrap(~ Type.of.feeding.interaction, ncol = 1, strip.position = "right") +  # the facet wrap stacks the graphs 
  theme_minimal() +
  theme(legend.position = "bottom") +
  guides(color = guide_legend(title = "Life Stage"))

# Define regression function with additional checks
Regression <- function(subset_data) {
  if (nrow(subset_data) > 1 && length(unique(subset_data$Prey.mass)) > 1 && length(unique(subset_data$Predator.mass)) > 1) {
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
        sep = " - "
      )
    ))
  } else {
    return(NULL) # Skip subsets with insufficient or constant data
  }
}

# Apply Regression function to each group using ddply
regression_results <- ddply(data, .(Type.of.feeding.interaction, Predator.lifestage), Regression)

# Filter out NULL rows
regression_results <- do.call(rbind, Filter(Negate(is.null), regression_results))
regression_results <- t(regression_results)
head(regression_results)

regression_results
# Write results to CSV
write.csv(regression_results, "../Results/PP_Regress_Results.csv", row.names = FALSE)

