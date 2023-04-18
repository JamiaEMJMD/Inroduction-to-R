install.packages(c("tidyverse", "nycflights13"))
library(tidyverse)

is_tibble(mtcars)

mtcars
mtcars.tib<-as_tibble(mtcars)
mtcars.tib
is_tibble(mtcars.tib)


var<-"mpg"

mtcars.tib$var
mtcars.tib[[var]]


print(nycflights13::flights)
print(nycflights13::flights,n_extra=3)

library(tibble)
tbl <- tibble( age = c(14, 18, 22, 12, 16, 19, 21, 24),
               chol = c(172, 180, 185, 170, 175, 188,190, 192),
      sex = c("male", "male","female", 
              "female", "female", "male", "male", "male" ))
tbl               
tbl$sex
library(tidyverse)
ggplot(tbl, aes(age, chol)) + geom_point()
mutate(tbl,chol2= chol^2)
transmute(tbl,one="age",two="chol",three="chol2")
