library(tidyverse)
load("data_final.RData")
load("data_final2.RData")

res1 <- lm(Score ~ Habit, data_long_score_t)
anova(res1)

res2 <- lm(Score ~ Habit + Judge, data_long_score_t)
anova(res2)

anova(res1, res2)

res3 <- lm(Score ~ Habit + situation, data_long_score_t)
anova(res3)

anova(res1, res3)