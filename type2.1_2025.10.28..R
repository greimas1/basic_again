rdata <- read.csv("P210202.csv")
str(rdata)
data <- rdata[1:nrow(rdata)*0.8,]
str(data)
colSums(is.na(data))
a <- sd(data$total_bedrooms, na.rm=TRUE)
a

data$total_bedrooms <- ifelse(is.na(data$total_bedrooms),median(data$total_bedrooms, na.rm=TRUE),data$total_bedrooms)
b <- sd(data$total_bedrooms)
b
result <- abs(a-b)
print(round(result,2))

