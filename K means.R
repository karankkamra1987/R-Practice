library(stats)

teens <- read.csv("D:/Personal/Data Science/R/Data/snsdata.csv")
str(teens)

table(teens$gender)

table(teens$gender, useNA = "ifany")

summary(teens$age)

"Cleaning Age"

teens$age <- ifelse(teens$age >= 13 & teens$age < 20,
                    teens$age, NA)

mean(teens$age, na.rm = TRUE)

'We can use the Grad year wise average year in teh respective record'
aggregate(data = teens, age ~ gradyear, mean, na.rm = TRUE)

ave_age <- ave(teens$age, teens$gradyear, FUN =
                 function(x) mean(x, na.rm = TRUE))

teens$age <- ifelse(is.na(teens$age), ave_age, teens$age)



'Cleaning Gender'
teens$female <- ifelse(teens$gender == "F" &
                         !is.na(teens$gender), 1, 0)


teens$no_gender <- ifelse(is.na(teens$gender), 1, 0)


'Keeping only numeric values'
interests <- teens[5:40]
interests_z <- as.data.frame(lapply(interests, scale))



set.seed(2345)
teen_clusters <- kmeans(interests_z, 5)


'Examining teh resuls'
teen_clusters$size

teen_clusters$centers

'Improving the performance'
teens$cluster <- teen_clusters$cluster
aggregate(data = teens, female ~ cluster, mean)


aggregate(data = teens, female ~ cluster, mean)

aggregate(data = teens, friends ~ cluster, mean)


