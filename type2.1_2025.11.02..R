library(dplyr)
library(caret)
library(randomForest)

rdata <- read.csv("P210204-01.csv")
str(rdata)
colSums(is.na(rdata))
rdata$Reached.on.Time_Y.N <- as.factor(rdata$Reached.on.Time_Y.N)

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
train <- rdata[idx,-1]
test <- rdata[-idx,-1]

md <- randomForest(Reached.on.Time_Y.N~., data = train)
pred <- predict(md, newdata=test, type="response")

cm <- confusionMatrix(pred, test$Reached.on.Time_Y.N, mode="everything")
cm
cm$byClass

rdata2 <- read.csv("P210204-02.csv")
str(rdata2)
colSums(is.na(rdata2))

id <- sample(1:nrow(rdata2), nrow(rdata2)*0.8)
train2 <- rdata2[id,-1]
test2 <- rdata2[-id,-1]

md2 <- randomForest(Reached.on.Time_Y.N~., data = rdata1[,-1])
pred2 <- predict(md2, newdata=rdata2[,-1], type="prob")

str(pred2)
typeof(pred2)
df <- data.frame(ID=rdata2[,c("ID")], prob=pred2[,2])
str(df)

write.csv(df, "type2.1.csv", row.names=FALSE)

###########################
library(dplyr)
library(caret)
library(randomForest)

rdata <- read.csv("P210204-01.csv")
str(rdata)
colSums(is.na(rdata))
rdata$Reached.on.Time_Y.N <- as.factor(rdata$Reached.on.Time_Y.N)

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
train <- rdata[idx,-1]
test <- rdata[-idx,-1]

md <- randomForest(Reached.on.Time_Y.N~., data = train)
pred <- predict(md, newdata=test, type="response")

cm <- confusionMatrix(pred, test$Reached.on.Time_Y.N, mode="everything")
cm
cm$byClass

rdata2 <- read.csv("P210204-02.csv")
str(rdata2)
colSums(is.na(rdata2))

id <- sample(1:nrow(rdata2), nrow(rdata2)*0.8)
train2 <- rdata2[id,-1]
test2 <- rdata2[-id,-1]

md2 <- randomForest(Reached.on.Time_Y.N~., data = rdata1[,-1])
pred2 <- predict(md2, newdata=rdata2[,-1], type="prob")

str(pred2)
typeof(pred2)
df <- data.frame(ID=rdata2[,c("ID")], prob=pred2[,2])
str(df)

write.csv(df, "type2.1.csv", row.names=FALSE)

