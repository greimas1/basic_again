rdata <- read.csv("P210201.csv")
library(dplyr)
str(rdata)
is.na(rdata)
tenth <-rdata$crim[10]
rdata$crim <- ifelse(rdata$crim>tenth, tenth, rdata$crim)
head(rdata,10)
tenth
data <- rdata %>% filter(age>=80)
result<-mean(data$crim)
print(round(result,2))


rdata <- read.csv("P210201.csv")
library(dplyr)
str(rdata)
is.na(rdata)
rdata %>% arrange(-crim)
tenth <- rdata$crim[10]
print(tenth)
tenth <-rdata$crim[10]
rdata$crim <- ifelse(rdata$crim>tenth, tenth, rdata$crim)
head(rdata,10)
tenth
data <- rdata %>% filter(age>=80)
result<-mean(data$crim)
print(round(result,2))