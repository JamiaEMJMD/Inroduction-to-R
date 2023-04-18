#Name: Jamia Begum
#NIU: 1676891

#ex-3.1
library(tidyverse)
diamonds
print(is.factor(diamonds$color))
pairs(diamonds[,c(1,5,6,7,8,9,10)]) #pairs function gives a 
#matrix of scatterplots to show the pairwise
#relationship between different variables in a dataset
#price and carat, carat and x,y,z etc are more correlated

library(ggplot2)
ggplot(data = diamonds, 
       aes(x=carat, y=price, color=color, size=cut))+
  geom_point()+
  theme(legend.position="bottom")      

library(lattice)
xyplot(diamonds$carat~diamonds$price|diamonds$color*diamonds$cut)


#ex-3.2
#a)
set.seed (9)
sm<-seq(0, 2, length = 201)
sample (sm,100)



#b)
y<-dt(seq(-1, 1, length = 21),df=13)
y
plot(y, type = "l", main = "t-distribution density function")

#c)
#pt returns the area to the left(the value of the cumulative density function (cdf))
#of a given value x in t distribution
#qt returns the value of the inverse cumulative density function (cdf) of t distribution 
x<-qt(0.01,df=9)
x

#d)
#The qnorm function allows to find the quantile (percentile) 
#for any probability. Hence, the qnorm function is the inverse of 
#the pnorm function. 
#find x, if P[X ≤ x] = .8 
qnorm(.8,100,15, lower.tail = TRUE)



#e)
#find x, if P[X ≤ x] = .1 
qnorm(.1,100,15, lower.tail = TRUE)



#f)
#The pnorm function gives the Cumulative Distribution Function (CDF) of
#the Normal distribution in R, which is the probability that
#the variable X takes a value lower or equal to x.
#find the probability, if P(X>140) = ? 
pnorm(140,100,15, lower.tail = FALSE)


#g)
set.seed(0)
#in standard normal distribution  the mean is 0 and the standard deviation is 1
r<-rnorm(50,0,1) 
sample(r,20)
sample(r,20)

set.seed(1676891)
r<-rnorm(50,0,1) 
sample(r,20)
sample(r,20)