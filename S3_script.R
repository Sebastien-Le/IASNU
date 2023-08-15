library(tidyverse)
load("data_final.RData")

data_long_score_t <- data_long_score %>% filter(Habit == "never_airplane_score"|
                                                  Habit == "unplug_score")
var.test(Score ~ Habit, data_long_score_t)

t.test(Score ~ Habit, data_long_score_t,
       var.equal = TRUE)