install.packages("kernlab")
library(kernlab)
library(e1071)


'Simple algorithm to recognize the leters, or clossification of 26 classes of letters'

letters <- read.csv("D:/Personal/Data Science/R/Data/letterdata.csv")
str(letters)

letters_train <- letters[1:16000, ]
letters_test <- letters[16001:20000, ]


letter_classifier <- ksvm(letter ~ ., data = letters_train,
                          kernel = "vanilladot")

letter_classifier

letter_predictions <- predict(letter_classifier, letters_test)

head(letter_predictions)


head(table(letter_predictions, letters_test$letter))

agreement <- letter_predictions == letters_test$letter

prop.table(table(agreement))

'improvement '

letter_classifier_rbf <- ksvm(letter ~ ., data = letters_train,
                              kernel = "rbfdot")

letter_predictions_rbf <- predict(letter_classifier_rbf,
                                  letters_test)

agreement_rbf <- letter_predictions_rbf == letters_test$letter
prop.table(table(agreement_rbf))

