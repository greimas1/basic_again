library(dplyr)
library(lubridate)
rdata <- read.csv("P230601.csv")
str(rdata)
rdata$신고일시 <- ymd_hm(rdata$신고일시)
rdata$출동일시 <- ymd_hm(rdata$출동일시)
rdata$출동시간 <- difftime(rdata$출동일, rdata$신고일시, units="secs")

data <- rdata %>% group_by(출동소방서, year(신고일시), month(신고일시)) %>% summarise(평균출동시간 = mean(출동시간)) %>% arrange(-평균출동시간)


str(data)

result <- data$평균출동시간[1]/60
result <- as.numeric(result)
print(round(result))

#data <- rdata %>% group_by(출동소방서) %>% summarise(출동시간=출동일시-신고일시)

str(data)

data <- data %>% arrange(-출동시간)

result <- data$출동시간[1]/60

print(result)

1441
분rdata <- rdata %>% mutate(출동시간 = 출동일시-신고일시)
str(rdata)
