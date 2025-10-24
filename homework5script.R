---
  title: "Homework5"
output: html_document
date: "2025-10-22"
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

PlayerStats <- read.csv("Homework5New.csv")
library(ggplot2)
stats_ggplot <- ggplot(PlayerStats)
```

## RQ1: How old are professional women soccer players?

```{r}

stats_ggplot +
  geom_histogram(aes(x = Age), binwidth = 2, fill = "#fec44f", color = "black") +
  labs(title = "Distribution of Player Ages", x = "Age", y = "Frequency") 

round(sd(PlayerStats$Age), 2)
round(median(PlayerStats$Age), 2)
round(mean(PlayerStats$Age), 2)
round(IQR(PlayerStats$Age), 2)
round(min(PlayerStats$Age), 2)
round(max(PlayerStats$Age), 2)
round(quantile(PlayerStats$Age, probs = c(0.25, 0.5, 0.75)), 2)
```

The distribution of player ages in the dataset is slightly right-skewed (positively skewed), with most values falling between 15 and 35 years. The mean age of players in the National Womens Soccer League across Australia, England, and Spain is approximately 27.53 years, while the median age is 27 years. Because the mean is slightly greater than the median, this supports the conclusion that the distribution is positively skewed. Since the median is closer to Q1, the upper half of the distribution is longer, and the IQR shows a larger spread exists above the median The standard deviation of 4.16 years suggests a moderate variation in ages around the average.

## RQ2: How is minutes played related to the number of goals scored for NWSL players? 

```{r}
x <- PlayerStats$Player
set.seed(5)

name <- sample(PlayerStats$Player,size=1)

stats_ggplot +
  geom_point(aes(x = Min, y = Goals, color = Player==name)) + 
  labs(title = "Comparison of Minutes Played and Goals Scored", x = "Minutes Played", y = "Goals Scored", color = name)

round(cor(PlayerStats$Min, PlayerStats$Goals), 2)
```

The analysis showed that while goals scored fall within a typical range with few outliers, minutes played are more evenly distributed across players. Visually, this suggests a weak relationship between the two variables. The Pearson correlation coefficient, calculated at approximately 0.21, supports this observation, indicating a weak positive correlation between goals scored and minutes played. This suggests that although players who score more goals often spend more time on the field, playing additional minutes does not necessarily result in more goals.