library(RWeka)

mushrooms <- read.csv("d:/personal/data science/r/data/mushrooms.csv", stringsAsFactors = TRUE)
str(mushrooms)

mushrooms$veil_type <- NULL
str(mushrooms)


mushroom_1R <- OneR(type~., data = mushrooms)
mushroom_1R
summary(mushroom_1R)

mushroom_JRip <- JRip(type~., data = mushrooms)
mushroom_JRip
summary(mushroom_1R)