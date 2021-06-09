library(rstudioapi)
setwd("C:/Users/Admin/Documents/R/Data")


#libraries
library(tidyverse)
library(lubridate)


week7_tbl <- tibble(read.csv("week7.csv")) %>% 
  mutate(timeStart= mdy_hm(timeStart)) %>%
  mutate(timeEnd=mdy_hm(timeEnd)) %>%
  mutate(gender= factor(gender, levels=c("M", "F"), labels=c("M"="Male", "F"="Female"))) %>%
  mutate(condition=factor(condition, levels=c("A","B","C"), labels=c("A"="Block A", "B"="Block B", "C"="Control"))) %>% 
  filter(q6==1) %>%
  select(-q6)
  glimpse(week7_tbl)
#Visualization
week7_tbl %>% select(q1:q10) %>% ggpairs()

ggplot(week7_tbl, aes(x=timeStart, y=q1)) + geom_point() + 
  labs(x="Date of Experiment", y="Q1 Score")


ggplot(week7_tbl, aes(x=q1, y=q2, color=gender)) + geom_jitter() 

ggplot(week7_tbl, aes(x=q1, y=q2,)) + geom_jitter() + facet_wrap(~gender) + 
  labs(x="Score on Q1", y="Score on Q2")

ggplot(week7_tbl, aes(x=gender, y=difftime(timeEnd,timeStart, units="secs"))) +
  geom_boxplot() +
  labs(x="Gender", y="Time Elapsed (secs)")

ggplot(week7_tbl, aes(x=q5, y=q7, color=condition)) + geom_jitter() + 
  geom_smooth(method="lm", se=FALSE) + labs(x="Score on Q5", y="Score on Q7") +
  theme(legend.position="bottom") + labs(color="Experiment Condition") + 
  theme(legend.background=element_rect(fill="light grey")) 


