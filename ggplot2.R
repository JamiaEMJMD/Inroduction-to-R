library(tidyverse)
library(dplyr)
library(nycflights13)
flights
#f<-mutate(flights,cancel=is.na(select(flights,dep_time)))
f<-mutate(flights,cancel=is.na(dep_time))
#true=canceled flights
#false=Non-canceled flights
f
pl<-select(f,dep_time,cancel)
pl
library(ggplot2)

       ggplot(pl,aes(x=cancel,fill=cancel)) +ggtitle("Canceled flights vs Non-canceled flights") +
         xlab("catergorized flights") +
         geom_bar()+
         geom_text(stat='count',aes(label=after_stat(count)), vjust=-0.5)

#Ex-2       
?diamonds
diamonds

         
#install.packages("corrplot")
#a)
library(corrplot)

M <- cor(diamonds[,c(1,5,6,7,8,9,10)])
M
corrplot(M, method = 'number')


ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.2)))

#b)
ggplot(diamonds, aes(x = cut, y = carat)) +
  geom_boxplot()



#ex-3:
library(nycflights13)
print(count(flights,carrier,month) ,n=Inf)

ggplot(data = flights, mapping = aes(x = factor(month),fill=factor(month))) +
  geom_bar() +
  facet_wrap(~ carrier, scales= "free")


#ex-4

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 5000)


ggplot(
  data = diamonds,
  mapping = aes( x = price)) +
  geom_freqpoly( mapping = aes(color = cut_number(carat, 6))) +
  labs(x = "Price", y = "Count", color = "Carat")
ggplot(
  data = diamonds,
  mapping = aes(color = cut_width(carat, .5, boundary = 0), x = price)) +
  geom_freqpoly() +
  labs(x = "Price", color = "Carat")+ggtitle("Freqpoly Plot of Carat vs Cut")



#ex´-5
library(tidyverse)
setwd("F:/INTERMATH/intermath 2021-2023/spain/DV/R for data Science")
genome<-read_delim('genome.txt')
genome
genome %>%
  group_by(Chr) %>% 
summarise(mean_log = mean(Log.R.Ratio, na.rm = TRUE)
          ,mean_B.Allele = mean( B.Allele.Freq, na.rm = TRUE))


ggplot(data = genome, aes(Position,Log.R.Ratio)) +
  geom_line(color = "blue", size = 1) +
  labs(title = "Facet plot of Log.R.Ratio",
       y = "Log.R.Ratio", x = "Position") + 
  facet_wrap(~ Chr)

ggplot(data = genome, aes(Position,B.Allele.Freq)) +
  geom_point(color="red") + 
  labs(title = "Facet plot of B.Allele.Freq",
       x = "position", y = "B.Allele.Freq") + 
  facet_wrap(~ Chr)
