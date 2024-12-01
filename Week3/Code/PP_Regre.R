rm(list=ls())


data <- read.csv("../Data/EcolArchives-E089-51-D1.csv")
data$Type.of.feeding.interaction <- as.factor(data$Type.of.feeding.interaction)
#instal packages
install.packages("ggplot2")
require(ggplot2)

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


regression_results <- data.frame(
  Predictor = character(),
  Slope = numeric(),
  Intercept = numeric(),
  R_Squared = numeric(),
  P_Value = numeric(),
  F_Statistic = numeric()
)
# create a function which caluclates 
Regression <- function(dependent, independent, predictor_name) {
  # Fit the regression model
  model <- lm(dependent ~ independent)
  model_summary <- summary(model)
  
  # Extract coefficients and metrics
  coefficients <- model_summary$coefficients
  Slope <- coefficients[2, 1]         # Slope
  Intercept <- coefficients[1, 1]     # Intercept
  P_Value <- coefficients[2, 4]       # p-value for the slope
  Fstatistic <- model_summary$fstatistic[1] # F-statistic
  R_Squared <- model_summary$r.squared # R-squared
  
  # Return the results as a single-row dataframe
  results <- data.frame(
    Predictor = predictor_name,
    Slope = Slope,
    Intercept = Intercept,
    R_Squared = R_Squared,
    P_Value = P_Value,
    Fstatistic = Fstatistic)
  # Return the new result
  return(results)
}


# insectivorus
insectivorous <- subset(data, Type.of.feeding.interaction == "insectivorous" &
                          Predator.lifestage == "larva / juvenile")
new_results <- Regression(insectivorous$Predator.mass, insectivorous$Prey.mass, "Insectivorous larva/juvenile")
regression_results <- rbind(regression_results, new_results)

# piscivorus
# 1
piscivorous_postlarva <- subset(data, Type.of.feeding.interaction == "piscivorous" & 
                                  Predator.lifestage == "postlarva")
new_results2 <- Regression(piscivorous_postlarva$Predator.mass, piscivorous_postlarva$Prey.mass, "Piscivorous larva")
regression_results <- rbind(regression_results, new_results2)

# 2
piscivorous_juvenile <- subset(data, Type.of.feeding.interaction == "piscivorous" & 
                                 Predator.lifestage == "juvenile")
new_results3 <- Regression(piscivorous_juvenile$Predator.mass, piscivorous_juvenile$Prey.mass, "Piscivorous juvenile")
regression_results <- rbind(regression_results, new_results3)

# 3
piscivorous_larva_juvenile <- subset(data, Type.of.feeding.interaction == "piscivorous" &  
                                       Predator.lifestage == "larva / juvenile")
new_results4 <- Regression(piscivorous_larva_juvenile$Predator.mass, piscivorous_larva_juvenile$Prey.mass, "Piscivorous larva/juvenile")
regression_results <- rbind(regression_results, new_results4)

# 4
piscivorous_adult <- subset(data, Type.of.feeding.interaction == "piscivorous" & 
                              Predator.lifestage == "adult")
new_results5 <- Regression(piscivorous_adult$Predator.mass, piscivorous_adult$Prey.mass, "Piscivorous adult")
regression_results <- rbind(regression_results, new_results5)

# 5
regression_results
# plankivorous

# 1
plankivorous_larva <- subset(data, Type.of.feeding.interaction == "planktivorous" &
                               Predator.lifestage == "larva")
new_results6 <- Regression(plankivorous_larva$Predator.mass, plankivorous_larva$Prey.mass, "Planktivorous larva")
regression_results <- rbind(regression_results, new_results6)

# 2 
plankivorous_juvenile <- subset(data, Type.of.feeding.interaction == "planktivorous" &
                                  Predator.lifestage == "juvenile")
new_results7 <- Regression(plankivorous_juvenile$Predator.mass, plankivorous_juvenile$Prey.mass, "Planktivorous juvenile")
regression_results <- rbind(regression_results, new_results7)

# 3 
plankivorous_larva_juvenile <- subset(data, Type.of.feeding.interaction == "planktivorous" &
                                        Predator.lifestage == "larva / juvenile")
new_results8 <- Regression(plankivorous_larva_juvenile$Predator.mass, plankivorous_larva_juvenile$Prey.mass, "Planktivorous larva/juvenile")
regression_results <- rbind(regression_results, new_results8)

# 4
plankivorous_adult <- subset(data, Type.of.feeding.interaction == "planktivorous" &
                               Predator.lifestage == "adult")
new_results9 <- Regression(plankivorous_adult$Predator.mass, plankivorous_adult$Prey.mass, "Planktivorous adult")
regression_results <- rbind(regression_results, new_results9)

# predacious

# 1
predacious_larva <- subset(data, Type.of.feeding.interaction == "predacious" & 
                             Predator.lifestage == "larva")
new_results10 <- Regression(predacious_larva$Predator.mass, predacious_larva$Prey.mass, "Predacious larva")
regression_results <- rbind(regression_results, new_results10)

# 2
predacious_postlarva <- subset(data, Type.of.feeding.interaction == "predacious" & 
                                 Predator.lifestage == "postlarva")
new_results11 <- Regression(predacious_postlarva$Predator.mass, predacious_postlarva$Prey.mass, "Predacious postlarva")
regression_results <- rbind(regression_results, new_results11)
# (11)
# 3
predacious_juvenile <- subset(data, Type.of.feeding.interaction == "predacious" & 
                                Predator.lifestage == "juvenile")
new_results12 <- Regression(predacious_juvenile$Predator.mass, predacious_juvenile$Prey.mass, "Predacious juvenile")
regression_results <- rbind(regression_results, new_results12)

# 4
predacious_larva_juvenile <- subset(data, Type.of.feeding.interaction == "predacious" & 
                                      Predator.lifestage == "larva / juvenile")
new_results13 <- Regression(predacious_larva_juvenile$Predator.mass, predacious_larva_juvenile$Prey.mass, "Predacious larva/juvenile")
regression_results <- rbind(regression_results, new_results13)

# 5
predacious_postlarva_juvenile <- subset(data, Type.of.feeding.interaction == "predacious" &
                                          Predator.lifestage == "postlarva/juvenile")
new_results14 <- Regression(predacious_postlarva_juvenile$Predator.mass, predacious_postlarva_juvenile$Prey.mass, "Predacious postlarva/juvenile")
regression_results <- rbind(regression_results, new_results14)

# 6
predacious_adult <- subset(data, Type.of.feeding.interaction == "predacious" &
                             Predator.lifestage == "adult")
new_results15 <- Regression(predacious_adult$Predator.mass, predacious_adult$Prey.mass, "Predacious adult")
regression_results <- rbind(regression_results, new_results15)

# predacious/piscivorous
predacious_piscivorous_adult <- subset(data, Type.of.feeding.interaction == "predacious/piscivorous" &
                                  Predator.lifestage == "adult") 
new_results16 <- Regression(predacious_piscivorous_adult$Predator.mass, predacious_piscivorous_adult$Prey.mass, "Predacious/Piscivorous adult")
regression_results <- rbind(regression_results, new_results16)


#aples function and creates a new colum for it 

write.csv(regression_results, "../results/PP_Regress_Results.csv", row.names = FALSE) 

