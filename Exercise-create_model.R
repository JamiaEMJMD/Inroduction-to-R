#Name: Jamia Begum
#NIU: 1676891



library(tidyverse)
#install.packages("caret")
library(caret)
library(MASS)
#Boston



#Split the data in 70% (train) and 30% (test)
## 75% of the sample size
smp_size <- floor(0.75 * nrow(Boston))
set.seed(123)
train_ind <- sample(seq_len(nrow(Boston)), size = smp_size)
#seq_len(nrow(Boston)) gives a vector of 1:nrow(Boston)
#train_ind gives the random row numbers of 70% of the size

train <- Boston[train_ind, ]
test <- Boston[-train_ind, ]
#train
#test


#creating the model
#Stepwise regression is a procedure we can use to build a regression model 
#from a set of predictor variables by entering and removing predictors in a 
#stepwise manner into the 
#model until there is no statistically valid reason to enter or remove any more.

#We will fit a multiple linear regression model using median house value (mdev)
#as our response variable and all of the other 13 variables 
#in the dataset as potential predictors variables.


#performing both-direction stepwise regression using step function
model<-step(lm(medv ~ ., data = train), trace = 0, direction = "both")

#view final model

model



#The goodness of fit of a statistical model
#describes how well it fits a set of observations. 
#one of the goodness of fit is the Root Mean Squared Error (RMSE) value,
#which measures the average prediction error made by the model in predicting 
#the outcome for an observation. That is, the average difference between
#the observed known outcome values and the values predicted by the model.
#The lower the RMSE, the better the model.

gof<-RMSE(fitted(model), train$medv)
gof


#validate the model in the test dataset and compare
predictions<-predict(model, newdata = test)

compare <- data.frame(Model = c("model on train data",
                                "model on test data"),
                 rmse = round(c(gof,RMSE(predictions, test$medv)),6)) 
                 
          
                                     
compare

#since the RMSE value is bit more for the test data,so our predictive model
#is a bit overfitting