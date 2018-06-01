library(tidyverse)
library(lubridate)
flights<-read_csv('2008.csv')
flights<-flights %>% 
 mutate(date=ymd(make_date(Year,Month,DayofMonth)))

lookUp1 <- setNames(c("carrier", "weather", "NAS","security"),c("A", "B", "C","D"))
lookUp <- as.tibble(read.table(text = "
                         CancellationCode   Cancellation_code
                     1   A  carrier
                     2   B  weather
                     3   C  NAS
                     4   D security", header = TRUE))

flights<-flights %>%
  left_join(lookUp, by = "CancellationCode") 




one_day<-flights %>%
  filter(date=="2008-08-01")

colnames(one_day)



cancellation_group<-one_day  %>%
  group_by(Cancellation_code) %>%
  summarise(count=n_distinct(FlightNum))


plot1<-ggplot(data = cancellation_group %>% filter(Cancellation_code !="NA")) + 
  geom_bar(aes(x=Cancellation_code,y=count),stat = "identity")

plot1
  


