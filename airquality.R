library(dplyr)
str(airquality)
is.na(airquality)
sum(is.na(airquality))
colSums(is.na(airquality))
summary(airquality)
table(is.na(airquality))
data1 <- airquality[complete.cases(airquality),]
data1
str(data1)
data2 <- na.omit(airquality)
str(data2)
data3 <- airquality[,colSums(is.na(airquality))==0]
data3
str(airquality)
airquality$Ozone <- ifelse(is.na(airquality$Ozone), median(airquality$Ozone, na.rm=TRUE),
                           airquality$Ozone)
airquality
str(airquality)
Ozone_m <- mean(airquality$Ozone)
Ozone_sd <- sd(airquality$Ozone)
data4 <- airquality %>% filter(abs(Ozone-Ozone_m)/Ozone_sd<3)
data4
df_quantile <- quantile(airquality$Ozone)
df_quantile
q1 <- df_quantile[2]
q3 <- df_quantile[4]
iqr <- abs(q3-q1)
iqr
