library(tidyverse)
load("data_final.RData")
load("data_final2.RData")

res1 <- lm(Score ~ Habit + Judge, data_long_score_t)
anova(res1)

data_paired <- data_final[,c("never_airplane_score", "unplug_score")]
data_paired %>% head()

t.test(data_paired$never_airplane_score,
       data_paired$unplug_score,
       paired = TRUE)

data_paired$difference <- data_paired$never_airplane_score - data_paired$unplug_score
t.test(data_paired$difference)

t.test(data_final$never_airplane_score, data_final$local_products_score,
       paired = TRUE)