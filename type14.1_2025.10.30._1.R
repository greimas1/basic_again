library(dplyr)
rdata <- read.csv("P230602.csv")

str(rdata)

rdata$teach_stu <- (rdata$student_1 + rdata$student_2 + rdata$student_3 + rdata$student_4 + rdata$student_5 + rdata$student_6)/rdata$teacher
str(rdata)
rdata <- rdata %>% arrange(-teach_stu)

str(rdata)

print(rdata$school_name[1])
"대구삼육초등학교"
> 
print(rdata$teacher[1])
print(rdata$teacher[1])
