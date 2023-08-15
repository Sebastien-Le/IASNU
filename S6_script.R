library(tidyverse)
load("data_final.RData")

res1 <- lm(Score ~ Habit, data_long_score)
anova(res1)

res.aov1 <- aov(Score ~ Habit, data_long_score) # fit the one-way ANOVA model
res.aov1 %>% summary() # get the results of the ANOVA test

library(agricolae)
res.t1 <- HSD.test(res.aov1, trt = "Habit")
# The `trt = "Habit"` argument is used to define the constant of the model (which in this case is the type of habit)
res.t1

res.t1$groups

res2 <- lm(Score ~ situation, data_long_score)
anova(res2)

res.aov2 <- aov(Score ~ situation, data_long_score)
res.t2 <- HSD.test(res.aov2, trt = "situation")
res.t2$groups