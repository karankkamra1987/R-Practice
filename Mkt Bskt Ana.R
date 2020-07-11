install.packages("arules")

'import the transactional data into a sparse matrix'
groceries <- read.transactions("D:/Personal/Data Science/R/Data/groceries.csv",sep = ",")
summary(groceries)


'Inspecting the data'
inspect(groceries[1:5])

itemFrequency(groceries[, 1:3])

itemFrequencyPlot(groceries, support = 0.05)

itemFrequencyPlot(groceries, topN = 20)

image(sample(groceries, 100))



'Model with different paramters of selecting rules cofidence and support'

apriori(groceries)
groceryrules <- apriori(groceries, parameter = list(support =
                                                      0.006, confidence = 0.25, minlen = 2))

summary(groceryrules)



inspect(groceryrules[1:3])

inspect(sort(groceryrules, by = "lift")[1:5])


berryrules <- subset(groceryrules, items %in% "berries")
inspect(berryrules)


write(groceryrules, file = "D:/Personal/Data Science/R/Data/result/groceryrules.csv",
      sep = ",", quote = TRUE, row.names = FALSE)


groceryrules_df <- as(groceryrules, "data.frame")


