library(dplyr)
rdata <- read.csv("P220503.csv", fileEncoding="Euc-kr")
str(rdata)
data <- rdata %>% mutate(순전입학생수=전입학생수.계.-전출학생수.계.) 
str(data)
data <- data %>% arrange(-순전입학생수)
str(data)
data$학교명[1]

print(data$전체학생수.계.[1])
print(data$학교명[1])
rownames(data.frame(data$학교명))[1]
