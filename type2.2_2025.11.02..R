library(dplyr)
library(caret)
library(randomForest)

rdata <- read.csv("P210304-01.csv")
str(rdata)
colSums(is.na(rdata))

rdata$TravelInsurance <- as.factor(rdata$TravelInsurance)

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
train <- rdata[idx,-1]
test <- rdata[-idx,-1]

md <- randomForest(TravelInsurance~., data=train, ntree=300)
pred <- predict(md, newdata=test, type="response")
cm <- confusionMatrix(pred, test$TravelInsurance)
cm$byClass

rdata2 <- read.csv("P210304-02.csv")
str(rdata2)
colSums(is.na(rdata2))


md2 <- randomForest(TravelInsurance~., data=rdata[,-1], ntree=300)
pred2 <- predict(md2, newdata=rdata2[,-1], type="prob")

str(pred2)
df <- data.frame(index=rdata2[,c("X")], y_pred=pred2[,2])

write.csv(df,"type2.2.csv", row.names=FALSE)
