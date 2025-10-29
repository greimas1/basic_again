install.packages("Metrics")
library(Metrics)
test <- c(3,5,7,9)
pred <- c(2,5,8,10)
rmse(test,pred)
mse(test,pred)^(1/2)

x <- c(2,3,4,5)
y <- c(4,6,8,9)

df <- data.frame(x,y)
md <- lm(y~x, df)
summary(md)

summary(md)$Coefficients

summary(md)$Residuals
mean(0.04, 0.01, 0.16, 0.09)/4
(0.04 + 0.01 + 0.16 + 0.09)/4

library(caret)
x <- c(1,0,1,0)
y <- c(0,0,1,1)
factor(x)
factor(y)
cm <- confusionMatrix(factor(x), factor(y))
cm1 <- confusionMatrix(factor(x), factor(y), mode="prec_recall")
cm1$byClass

cm2 <- confusionMatrix(factor(x), factor(y), mode="everything")
cm2$byClass

cm$byClass

library(ModelMetrics)
auc(test,pred)



library(mlbench)
df<-data("trees")
df <- trees
str(df)

idx <- sample(1:nrow(df), nrow(df)*0.8)
train <- df[idx,]
test <- df[-idx,]

md <- lm(Volume~., data=train)
summary(md)

pred <- predict(md, newdata=test, type="response")

rmse(test$Volume,pred)

library(dplyr)
library(Metrics)
data("PimaIndiansDiabetes2")
PimaIndiansDiabetes2
data <- PimaIndiansDiabetes2
data
str(data)
colSums(is.na(data))
data <- data %>% na.omit()


idx <- sample(1:nrow(data), nrow(data)*0.8)
train <- data[idx,]
test <- data[-idx,]

md2 <- glm(diabetes~., data=train, family="binomial")
summary(md2)


pred <- predict(md2, newdata=test, type="response")
pred

pred <- as.factor(ifelse(pred>=0.5, "pos", "neg"))
pred

library(caret)
cm<-confusionMatrix(pred,test$diabetes)
cm$byClass

auc(test$diabetes, pred)
