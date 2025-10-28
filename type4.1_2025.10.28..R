library(dplyr)
rdata <- read.csv("P210301.csv")
str(rdata)
colSums(is.na(rdata))
rdata <- rdata %>% na.omit()
str(rdata)
colSums(is.na(rdata))

data <- rdata[1:nrow(rdata)*0.7,]
q1 <- quantile(data$housing_median_age,0.25)
print(q1)


library(dplyr)
rdata <- read.csv("P210301.csv")
str(rdata)
colSums(is.na(rdata))
rdata <- rdata %>% na.omit()
str(rdata)
colSums(is.na(rdata))

data <- rdata[1:nrow(rdata)*0.7,]
q1 <- quantile(data$housing_median_age,0.25)
print(q1)
