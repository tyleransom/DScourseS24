library(NHANES)
library(tidyverse)
library(rstatix)

# Load data from 2009-2010 and 2011-2012 cycles
data <- NHANES %>%
    filter(SurveyYr %in% c("2009_10", "2011_12"))

# Select relevant variables
selected_vars <- c("Age", "Gender", "Race1", "Education", 
                   "Poverty", "BMI", "BMICatUnder20yrs", "Diabetes",
                   "PhysActiveDays", "AlcoholYear", "SmokeNow")

data <- data %>%
    select(all_of(selected_vars))

# Clean and preprocess data
data <- data %>%
    mutate(
        Gender = factor(Gender),
        Race1 = factor(Race1),
        Education = factor(Education),
        BMICatUnder20yrs = factor(BMICatUnder20yrs),
        Diabetes = factor(Diabetes),
        SmokeNow = factor(SmokeNow)
    )

# 1. Descriptive statistics
summary(data)

# 2. Pearson correlations
cor_vars <- c("Age", "Poverty", "BMI", "PhysActiveDays", "AlcoholYear")
cor_matrix <- data %>%
    select(all_of(cor_vars)) %>%
    cor(use = "pairwise.complete.obs")

print(cor_matrix)

# 3. Group comparisons
data %>%
    filter(!is.na(Gender)) %>%
    t_test(BMI ~ Gender) %>%
    print()

data %>%
    filter(!is.na(Race1)) %>%
    anova_test(BMI ~ Race1) %>%
    print()

# 4. Linear regression models
lm_bmi <- data %>%
    filter(Age >= 20) %>%
    lm(BMI ~ Age + Poverty + PhysActiveDays + AlcoholYear + SmokeNow, data = .)

summary(lm_bmi)

# Visualizations
data %>%
    ggplot(aes(x = Poverty, y = BMI)) + 
    geom_point() + 
    geom_smooth(method = "lm") +
    labs(x = "Poverty", y = "BMI")

data %>%
    filter(Age < 20) %>%
    ggplot(aes(x = PhysActiveDays, y = BMI)) + 
    geom_point() + 
    geom_smooth(method = "lm") +
    labs(x = "Days of Physical Activity", y = "BMI")

data %>%
    filter(!is.na(Race1)) %>%
    ggplot(aes(x = Race1, y = BMI, fill = Race1)) + 
    geom_boxplot() +
    labs(x = "Race/Ethnicity", y = "BMI", fill = "Race/Ethnicity")