library(tidyverse)
library(lubridate)
rm(flights)
flights<-read.csv('2008.csv')
flights<-flights %>% 
        mutate(date=make_date(Year,Month,DayofMonth))

head(flights) 
ggplot(data = flights,aes(Distance))+geom_histogram()
airport<-read.csv('airports.csv') 

head(airport)


flights<-left_join(flights,select(airport,iata,airport),by = c("Origin"="iata"))

colnames(flights)[colnames(flights) == 'airport'] <- 'Origin Airport'

flights<-left_join(flights,select(airport,iata,airport),by = c("Dest"="iata"))

colnames(flights)[colnames(flights) == 'airport'] <- 'Dest Airport'

head(airport)



