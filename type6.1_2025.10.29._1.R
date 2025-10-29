rdata <- read.csv("P210303.csv")
library(dplyr)
str(rdata)
#str(rdata)
#data <- rdata %>% na.omit()
#str(data)
#data

data <- rdata[,c("country", "year", "new_sp")]
str(data)
colSums(is.na(data))
data <- data %>% na.omit()

data1 <- data %>% filter(year=="2000")

data2 <- data1 %>% group_by(country) %>% summarise(mean_sp=mean(new_sp))
str(data2)

data3 <- data %>% filter(year=="2000") %>% group_by(country) %>% summarise(mean_sp=mean(new_sp))

m_sp<-mean(data3$mean_sp)

data4 <- data3 %>% filter(data3$mean_sp>m_sp)
result <- nrow(data4)
print(result)
