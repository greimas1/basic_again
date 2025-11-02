library(dplyr)
library(randomForeset)
library(Metrics)

rdata <- read.csv("P220504-01.csv")
str(rdata)
colSums(is.na(rdata))

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
train <- rdata[idx,]
test <- rdata[-idx,]

md <- randomForest(price~., data=train, ntee=300)
pred <- predict(md, newdata=test, type="response")
rmse(test$price, pred)
2680.16

rdata2 <- read.csv("P220504-02.csv")
str(rdata2)
colSums(is.na(rdata2))

md2 <- randomForest(price~., data=rdata, ntee=300)
pred2 <- predict(md2, newdata=rdata2, type="response")

str(pred2)
df <- data.frame(pred=pred2)
write.csv(df, "type2.4.csv", row.names=FALSE)
