library(dplyr)
iris
str(iris)
view(iris)
data <- iris %>% select(Petal.Length)
data
view(data)
str(data)
data <- iris %>% select(Petal.Length, Species)
data
data1 <- iris %>% select(-Species)
data1
data2 <- iris %>% filter(Species=="virginica")
data2
str(data2)
data3 <- iris %>% filter(Petal.Length > 3)
str(data3)
data3
data4 <- iris %>%
  mutate(Petal.Q=Petal.Length/Petal.Width)
data4
str(data4)
str(iris)
iris$Petal.Q <- iris$Petal.Length/iris$Petal.Width
str(iris)
data5 <- iris %>% group_by(Species)%>%summarise(mean=mean(Petal.Length))
data6 <- iris %>% group_by(Species)%>% summarise(mean(Petal.Length), sd(Petal.Length))
data7 <- iris %>% arrange(Petal.Length)
data8 <- iris %>% arrange(-Petal.Length)
data9 <- iris %>% arrange(desc(Petal.Length))
data9
