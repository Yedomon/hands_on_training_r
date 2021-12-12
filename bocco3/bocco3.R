library(ggplot2)
library(ggrepel)


getwd()
setwd("C:/Users/ange_/Downloads/")

data_ft319 = read.csv("ft319.csv", h = T, sep = ";", dec = ",")

View(data_ft319)

names(data_ft319)


# Plot

ggplot(data = data_ft319, aes(x=Dayafterspraying, y=Mean,  fill =Treatment, label = Letter )) +
  geom_bar(stat="identity", position="dodge") +
  geom_errorbar(aes(ymin = Mean-Std, ymax = Mean + Std), width = 0.2, position=position_dodge(.9)) +
  geom_text(position = position_dodge(0.85), vjust = -2)+
  labs(x = "Days after spraying", y = "Percentage of mortality") +
  theme_bw() 




###ft337

data_ft337 = read.csv("ft337.csv", h = T, sep = ";", dec = ",")


# Plot

ggplot(data = data_ft337, aes(x=Dayafterspraying, y=Mean,  fill =Treatment, label = Letter )) +
  geom_bar(stat="identity", position="dodge") +
  geom_errorbar(aes(ymin = Mean-Std, ymax = Mean + Std), width = 0.2, position=position_dodge(.9)) +
  geom_text(position = position_dodge(0.85), vjust = -2)+
  labs(x = "Days after spraying", y = "Percentage of mortality") +
  theme_bw() 

  




