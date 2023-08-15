# Loading the packages that you need #
library(tidyverse)

# Importing the data needed for analysis #
# It is in RData form, which is very easy to import #
# You can use the following code to import it...#
load("data_final.RData")

# But you can also import it by double clicking the `data_final.RData` file! #


# Summarizing the data to see if it was imported correctly #
data_final[2:11] %>% summary()

A <- data_final[2:11] %>% apply(2, table) %>% t() %>% as.data.frame()
A %>% relocate(Yes) %>% arrange(desc(No))

G1 <- ggplot(data_final, aes(x = air_drying))+
  geom_bar(fill = c("grey23", "grey69"))+
  ggtitle("Air drying laundry") +
  theme_minimal()+
  ylim(0, 160)+
  theme(plot.title = element_text(hjust = 0.5))
G1

G2 <- ggplot(data_final, aes(x = vegetarian))+
  geom_bar(fill = c("grey23", "grey59"))+
  ggtitle("Becoming vegetarian")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))
G2

G3 <- ggplot(data_final, aes(x = vegetarian))+
  geom_bar(fill = c("grey23", "grey59"))+
  ggtitle("Becoming vegetarian")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))+
  ylim(0, 160)
library(gridExtra)
grid.arrange(G1, G3, ncol = 2)

data_final[12:21] %>% apply(2, mean) %>% round(1)
data_final[12:21] %>% apply(2, mean) %>% round(1) %>% sort(decreasing = TRUE)


CN <- data_final[12:21] %>% apply(2, mean) %>% sort(decreasing = TRUE) %>%
  as.data.frame() %>% rownames()

data_long_score2 <- data_long_score
data_long_score2$Habit <- data_long_score2$Habit %>% factor(levels = CN)

ggplot(data_long_score2, aes(x = Score))+
  geom_histogram(binwidth = 1,
                 color = "grey10", fill = "grey59")+
  ggtitle("Distribution of score of constraint for each habit")+
  geom_vline(aes(xintercept = 2.5),
             linetype = "dashed", size = 1)+
  theme_minimal()+
  facet_wrap(~Habit)