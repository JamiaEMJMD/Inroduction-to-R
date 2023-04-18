#Name: Jamia Begum
#NIU: 1676891

setwd("F:/INTERMATH/intermath 2021-2023/spain/DV/Data for assignement 2-20221004")


#ex-2.1

A <- matrix(seq(3,19,by=2), nrow=3,ncol =3,byrow=T)
A
B <-matrix(seq(100,110,by=2),nrow=3,ncol=2)
B

#a

C<- cbind(A,B) #combine matrices by Columns
C

#b

#H<- rbind(A,B) #not possible as the number of columns doesn't match here
Bn <-matrix(seq(100,116,by=2),nrow=3,ncol=3)
Bn
H<- rbind(A,Bn)
H

#c

t(B)
G<- rbind(A, t(B))
G

#d
dim(G)

#e
G[5,2] #value of fifth row and 2nd column


#f
C[3,] #3rd row
C[,2] #2nd column


#g
#submatrix of transpose of G
sg<-t(G)[c(1,3),c(2,4)]
sg

#h
arr<- array(1:32, dim=c(4,4,2)) #2 matrices 4*4
arr

#i

arr[2,4,1] #element in first matrix

#j

arr[1,3,2] #element in 2nd matrix

#k

arr[2,4,1]+ arr[1,3,2]

#l

arr[2, ,2]



#Ex-2.2
w= c(1,2,3,4)
B=matrix(c(1,0,0,0,2,0,0,0,3),nrow=3,ncol=3)
library(MASS) #to include MASS from library package

treatment<- data.frame(anorexia)
#creating list with non-homogeneous data
list.1 <- list(Vector=w,Matrix=B,Dataframe=treatment)
list.1

#a:

list.1[c(2,3)]

#b

m=list.1[[2]] #matrix
m
solve(m) #inverse matrix

#c

print(list.1$Dataframe$Treat)

#d

d<- data.frame(weight= c(50,60,70,80,90), gender = c("f","f","m","f","m"))
d

list.1$newdata<-d
list.1

#e
list.2 <- list(v=c(1,2,3,4),w=c(20,30,40,50))
list.2

list.3<- c(list.1,list.2)
list.3

 

#ex-2.3
#a) read txt file with header
datar<-read.table("example2.txt",header=TRUE)
datar


#b)

pdatar<- datar[10:18,]
pdatar

#c)
rdatar<- datar[c(2,5,23),2]
rdatar

#d)
summary(datar)
print(sd(datar$yrs))
print(sd(datar$happy))

#ex-2.4
#a)
patients<- data.frame(id=paste("DP",1:6,sep=""),age=c(25,34,28,52,74,63),
                      gender=factor(c("M","M","F","M","M","F")),diabetes=factor(paste("Type",c(1,2,1,2,2,1),sep="")),
                      status=factor(c("poor","Improved","Excellent","Poor","Improved","Poor")))
patients

summary(patients)

#b)
mean(patients$age)
  
  #c)

#subdata frame of patients
male<-subset(patients,patients$gender=="M",)
male

#d)
max(male$age)
  
#e)

patients$age[patients$id=="DP3"]=29 #change age 28 to 29
patients

#ex:2.5

monkey<- read.csv("https://opendata.ecdc.europa.eu/monkeypox/casedistribution/csv/data.csv")
str(monkey) #see details

#a
monkey$CountryCode<-factor(monkey$CountryCode)
monkey$CountryCode

#b

monkey.h <- monkey[monkey$CountryExp== c("Netherlands", "France", "Germany" , "Spain"),]
monkey.h

#c
#no of cases in France

sum(monkey.h[monkey.h$CountryExp=="France",5])
#no of cases in Germany
sum(monkey.h[monkey.h$CountryExp=="Germany",5])
#no of cases in Netherlands
sum(monkey.h[monkey.h$CountryExp=="Netherlands",5])
#no of cases in Spain
sum(monkey.h[monkey.h$CountryExp=="Spain",5])

#d)

#substr to extract character from a variable in a dataframe
monkey.h$Day=substr(monkey.h$DateRep,9,10)
monkey.h$Month=substr(monkey.h$DateRep,6,7)
monkey.h$Year=substr(monkey.h$DateRep,1,4)

monkey.h

#e)
mc1<-monkey.h[monkey.h$ConfCases==1,]

firstcase<-mc1[c(1,2,3,6),]
firstcase

#f
monkey
bycountry<- split(monkey,monkey$CountryExp) #arrange dataframe as a list according to the levels of the factor
bycountry

#g)
sum(bycountry$Belgium$ConfCases)






#ex-2.6
unzip("readdata.zip", list = TRUE)
data<-read.csv(unzip("readdata.zip","data.csv"))
data1<-read.csv(unzip("readdata.zip","data1.csv"))
data2<-read.csv(unzip("readdata.zip","data2.csv"),sep=",")
data3<-read.csv(unzip("readdata.zip","data3.csv"),sep=",")
data4<-read.csv(unzip("readdata.zip","data4.csv"),sep=";")
data5<-read.csv(unzip("readdata.zip","data5.csv"),sep=" ")


dl<- list(data,data1,data2,data3,data4,data5)
dl




#ex-2.7

precipt<- read.table("HadCEP_monthly_totals.txt")

july<-precipt[precipt$V1%in%2012:2020,8]
july
