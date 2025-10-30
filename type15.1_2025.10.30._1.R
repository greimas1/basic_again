library(dplyr)
library(lubridate)
rdata <- read.csv("P230603.csv")
rdata$년 <- substr(rdata$년월,1,4)
rdata$년 <- year(rdata$년)

rdata$월 <- substr(rdata$년월,6,7)

rdata$crim <- rdata$강력범 + rdata$절도범 + rdata$폭력범 + rdata$지능범 + rdata$풍속범 + rdata$기타형사범

str(rdata)


data <- rdata %>% group_by(substr(rdata$년월,1,4)) %>% summarise(월평균범죄건수=mean(crim)) %>% arrange(-월평균범죄건수)

result <- data$월평균범죄건수[1]

print(as.integer(result))19329
> 
str(data)

str(data)
