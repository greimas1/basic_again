library(dplyr)
library(caret)
library(randomForest)

rdata <- read.csv("P220404-01.csv")
str(rdata)
colSums(is.na(rdata))
rdata$Segmentation <- as.factor(rdata$Segmentation)

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8) #0.8
train <- rdata[idx, -1]
test <- rdata[-idx,-1]

md <- randomForest(Segmentation~., data=train, ntree=300)
pred <- predict(md, newdata=test, type="response")
str(pred)


rdata2 <- read.csv("P220404-02.csv")
str(rdata2)
colSums(is.na(rdata2))

md2 <- randomForest(Segmentation~., data=rdata[,-1], ntree=300)
pred2 <- predict(md2, newdata=rdata2[,-1], type="response")
str(pred2)
df <- data.frame(ID=rdata2[,c("ID")], pred=pred2)

write.csv(df, "type2.3.csv" , row.names=FALSE)
