library(tidyverse)
library("nycflights13")
library("dplyr")
flights
filter(flights, arr_delay >= 120)
select(flights,dest)
filter(flights, dest == "IAH" | dest == "HOU") 
filter(flights, arr_delay > 120, dep_delay <= 0)
filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30)


filter(flights, between(arr_delay, 120, Inf) )
filter(flights, between(arr_delay, 120, Inf)& between(dep_delay,-Inf,0) )
filter(flights, between(dep_delay, 60, Inf)& between(dep_delay- arr_delay,31,Inf) )



arrange(flights, air_time)
arrange(flights, desc(distance / air_time))


dep_str=select(flights, contains("dep"))
dep_str

dp_flights<-mutate(flights,dep_hour=dep_time %/% 100, dep_min = dep_time %% 100)
select(dp_flights,dep_time,dep_hour,dep_min)

flights %>%
  group_by(carrier) %>% summarise( count = n(), mean_delay = mean(arr_delay, na.rm = TRUE)
  ,median_delay = median(arr_delay, na.rm = TRUE),
  IQR_delay = IQR(arr_delay, na.rm = TRUE))
mn<-flights %>%
  group_by(month) %>% summarise( count = n())
mn
ggplot(mn, aes(x = factor(month),fill = count)) +
  geom_boxplot()
count(flights,month)
