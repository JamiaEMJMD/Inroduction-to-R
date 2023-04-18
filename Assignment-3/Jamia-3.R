setwd("F:/INTERMATH/intermath 2021-2023/spain/DV/Ex3")

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


#ex-3.3
#a)
x<- 1:20
x

#b)
w <- 1 + sqrt(x)/2
w

#c)
set.seed(0)
dummy <- data.frame(x = x,
                 y = x + rnorm(x)*w)
df

#d)
#To save a plot as jpeg image:
#need to call the function dev.off() after all the plotting,
#to save the file and return control to the screen
#This will save a jpeg image in the current directory
jpeg("histogram_boxplot.jpeg", quality = 75)
ly<- layout( matrix(c(1,2), ncol=2) )
hist(dummy$y, xlab="histogram of y",col=4,main="")
boxplot(dummy$y ,col=3, xlab="boxplot of y")
dev.off()

#e)
plot(dummy$x , dummy$y,type = "b", pch = 19, 
     col = "red",
     ylab="x + rnorm(x)*w"  , xlab="x", main="Y vs X")

#f)
fm <- lm(y~x, data=dummy)
# adding a regression line
abline(fm,col='blue')

#g)
#residual of a regression
#The difference between an observed value of the response variable 
#and the value of the response variable predicted from the regression line.
resids <- resid(fm)
resids
#The Q-Q plot, or quantile-quantile plot, is a graphical tool to help us assess
#if a set of data plausibly
#came from some theoretical distribution such as a Normal or exponential
#A Q-Q plot is a scatterplot created by plotting two sets of quantiles against 
#one another. If both sets of quantiles came from the same distribution,
#we should see the points forming a line that’s roughly straight. 
qqnorm(resids)
#In the normal Q-Q plot, x-axis plots the theoretical quantiles from the 
#standard Normal distribution with mean 0 and standard deviation 1 and since
# the points are almost making a straight line,so we can say that the residuals 
#are normally distributed


#Ex-3.4

#a)
airquality
#coplot is a conditioning plot
coplot(Ozone~Solar.R|Temp,data=airquality,number=3) 
#number=3 creating 3 intervals
coplot(Ozone~Solar.R|Wind,data=airquality,number=3)


#b)
hist(airquality$Wind, 
     col="blue", 
     prob = TRUE, # show densities instead of frequencies
     xlab = "Wind",
     main = "histogram of Wind with density curve")
lines(density(airquality$Wind), # density plot
      lwd = 2, # thickness of line
      col = "red")


#ex-3.5

#a)
st=("apple,banana,guava")
st
convert<- function(x){
  x <- gsub(pattern = ",", replacement = ".",x = x)
  return(x)
}
convert(st)


#b)

convert_number <- function(x){
  x <- gsub(pattern = ",", replacement = ".",x = x)
  x <- as.numeric(x)
  return(x)
}
convert_number("3,1416")


countries<-read.csv("countries of the world.csv")
countries
lapply(countries[c(5,6,7,8,10,11,12,13,14,16,17,18,19,20)],convert_number)





#ex-3.6
#a)
conv<- function(v1,v.na){
  v1[v1 %in% v.na]= "NA"
print(v1)  
}
conv(c("a","c","d"), c("a","b","d"))

#redo ex-1.4(a)
rincome <-scan("rincome.txt",character (),sep="\n",skipNul = T)
conv(rincome,c("Don’t know", "No answer" ,"Not applicable" , "Refused"))


#b)
big.values<- function(v,tresh){
  v[v > tresh]= NA
  print(v)  
}
big.values(c(1,2,3,4,5,6),4)


#d)

big.values(airquality,320)


#ex-3.7)
append.f<- function(my_data,new){
  
 
 if( nrow(my_data)==length(new)){
   my_data$new.variable<-new
    print(my_data)
 } else {
   print("the lenghth of the vector is wrong")
 }

}
airquality
append.f(airquality,new=c(1,2,3,4))

append.f(airquality[1:4,],new=c(1,2,3,4))

#ex-3.8

df <- data.frame (x = c(1,2,NA,4,5,6),
                  y = c(7,8,9,10,NA,12))
nrow(df)

 sum12_2_3<- function(data,a,b){
   v= NULL #to create v as a vector has to define it first
   for (i in 1:nrow(data)) {
     
   data[is.na(data)] <- 0
   print(i)
   v[i]<-a*sum(data[1:i,1])+b*sum(data[1:i,2])
   data$sum12<-v
   }
   print(data)
 }
 sum12_2_3(df,2,3)
  

#ex-3.9

x<- c(8, 5, 3, 7, 8, 1, 6, 5) 
mdiq <- function(x) {
md<-median(x)
IQ<-IQR(x) #Interquartile range is the subtraction of the first quartile from t
cat("median is",md,"interquartile range range is",IQ,sep="\n" )
return(boxplot(x) ) 
}
mdiq(x)


#ex-3.10

sum(1:100)
#using loop
add <- 0 
for (x in 1:100) {
    add <- add+x  
  }
  cat("The sum is :",add)
  
  
#ex-3.11
  
monkey<- read.csv("https://opendata.ecdc.europa.eu/monkeypox/casedistribution/csv/data.csv")
monkey 
bycountry<- split(monkey,monkey$CountryExp)
bycountry
bycases<-lapply(bycountry,"[",5)#extract specific columns of each dataframe
#from the list of dataframes
#sapply(X, FUN) sapply() function takes list, vector or data frame as input and 
#gives output in vector or matrix
#FUN: Function applied to each element of x
cases<-sapply(bycases,sum)# sapply() returns Sum within list element as a vector
cases
sort(cases, decreasing=TRUE)
sort(cases, decreasing=TRUE)[1:6]
