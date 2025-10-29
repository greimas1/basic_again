rdata <- read.csv("P220501.csv", fileEncoding="Euc-kr")
str(rdata)
library(dplyr)

data <- rdata %>% filter(종량제봉투종류=="규격봉투" & 종량제봉투용도=="음식물쓰레기" & X2L가격!=0)

result <- mean(data$X2L가격)
result
print(as.integer(result))
      
      