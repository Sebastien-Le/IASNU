library(tidyverse)
load("data_final.RData")

t.test(data_long_score[data_long_score$Habit=="vegetarian_score",]$Score)

t.test(data_long_score[data_long_score$Habit == "vegetarian_score",]$Score,
       mu = 3, alternative = c("greater"))

t.test(data_long_score[data_long_score$Habit=="air_drying_score",]$Score)

