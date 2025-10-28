library(dplyr)
rdata <- read.csv("P210203.csv")
str(rdata)
rdata$charges
charges_m<-mean(rdata$charges)
charges_sd <-sd(rdata$charges)
#data <- rdata %>% filter(charges>charges_m+charges_sd*1.5 & charges<charges_m-charges_sd*1.5)
data <- rdata %>% filter(charges>charges_m+charges_sd*1.5 | charges<charges_m-charges_sd*1.5)
head(data,10)
result <- sum(data$charges)
print(round(result))
result
data
