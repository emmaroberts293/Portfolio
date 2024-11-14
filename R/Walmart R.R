library(tidyverse)
library(summarytools)
library(ggplot2)
library(readr)
walmart <- read_csv("C://Users/lulur/Desktop//walmart.csv", col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                    Weekly_Sales = col_number(), Fuel_Price = col_number()))
View(walmart)

dfSummary(walmart)
summary(is.na(walmart))
mean(walmart$Weekly_Sales, na.rm=TRUE)
median(walmart$Weekly_Sales, na.rm=TRUE)
sd(walmart$Weekly_Sales, na.rm=TRUE)
cor(walmart[,c("Weekly_Sales", "Temperature", "Fuel_Price")], use="complete.obs")
ggplot(walmart,aes(x=Weekly_Sales))+
  geom_histogram(binwidth=5000, fill="blue", color="black")
ggplot(walmart,aes(y=Weekly_Sales))+
  geom_boxplot()
ggplot(walmart,aes(x=Temperature,y=Weekly_Sales))+
  geom_point()+
  geom_smooth(method="lm", se=FALSE)
ggplot(walmart,aes(x=Date,y=Weekly_Sales))+
  geom_line()+
  scale_x_date(date_labels="%b%Y")+
  labs(title="Weekly Sales Over")