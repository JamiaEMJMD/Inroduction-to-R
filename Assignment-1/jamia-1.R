#Name: Jamia Begum
#NIU: 1676891

#set working directory

setwd("F:/INTERMATH/intermath 2021-2023/spain/DV/DVM")
ls()

#exercise-1.1

year=2012:2022
Precip<-c(99.30, 48, 51, 74.90, 35.10, 80.90, 26.60, 
          66.20, 63, 70.10, 14.70)
mean_precip=mean(Precip);
mean_precip
anomaly<- Precip - mean_precip
anomaly
plot(year,Precip, xlab="year", ylab="Precip", main="Precip vs year",
     pch=10,type='o', col="blue")
axis(side=1, at = year) #side=1 for axis=x
#axis(side=2, at = Precip )

summary(Precip)

#exercise-1.2:

set.seed(1676891) #guarantees that the same random values are produced each time runing the code
x<-sample(1:10,200,replace=TRUE)
x
#one

table(x) #gives frequencies of the elements
frequency_of_7_in_x= sum(x==7)
frequency_of_7_in_x

#two

one_thirtyoneth=x[131]
one_thirtyoneth

#three
x[seq(22,40,2)]

#four

x

replace(x,x==7,50)

#five

z=x[x>85]
z

#six

sqrt(x)
ms=mean(sqrt(x))
ms

#seven
zx=c(x,z)
zx
length(zx)

#eight
ls()
rm(zx)
ls()

#ex-1.4

v1=rep(c("x","y","z"),times=4)
v3=rep(c("x","y","z"),each=4)
v2=rep(1:4, each =3)
v4=rep(1:4, times =3)
c1=paste(v1,v2,sep="")
c2=paste(v3,v4,sep="")
#two character vectors
c1
c2

rincome <-scan("rincome.txt",character (),sep="\n",skipNul = T)
rincome
#one

rincome[rincome %in% c("Don’t know", "No answer" ,"Not applicable" , "Refused")]= "NA"
rincome %in% c("Don’t know", "No answer" ,"Not applicable" , "Refused")
rincome[rincome %in% c("Don’t know", "No answer" ,"Not applicable" , "Refused")
]
rincome
#two 

rincome.f <- factor(rincome)
C
levels(rincome.f)
summary(rincome.f)

#three
rincome.lv <- levels(rincome.f)
rincome.lv

#four

rincome.lv=c(rincome.lv[13],rincome.lv[1:12],rincome.lv[14])
rincome.lv
#five
rincome.o <- ordered(rincome.f,levels=rincome.lv)
rincome.o

#six
summary(rincome.o)
summary(rincome.f)

#seven
ls()
rm(h)
class(C)
class(c1)
class(c2)
class(one_thirtyoneth)
class(Precip)
class(rincome.o)
class(rincome.f)
class(year)
