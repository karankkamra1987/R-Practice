library(C50)


credit<- read.csv("D:/Personal/Data Science/R/Data/credit.csv")
str(credit)
table(credit$default)

set.seed(123)
train_sample <-sample(1000,900)
str(train_sample)

credit_train <- credit[train_sample,]
credit_test <- credit[-train_sample,]

credit_train$default<-as.factor(credit_train$default)
str(credit_train$default)

prop.table(table(credit_train$default))
prop.table(table(credit_test$default))


credit_model <- C5.0.default(credit_train[-17], credit_train$default)
credit_model <- C5.0(credit_train[-17], credit_train$default)
credit_model

summary(credit_model)

credit_pred <- predict(credit_model, credit_test)
library(gmodels)
CrossTable(credit_test$default, credit_pred,
             prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
             dnn = c('actual default', 'predicted default'))


credit_boost10 <- C5.0(credit_train[-17], credit_train$default,
                       trials = 10)
credit_boost10
credit_boost_pred10 <- predict(credit_boost10, credit_test)
CrossTable(credit_test$default, credit_boost_pred10,
             prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
             dnn = c('actual default', 'predicted default'))


matrix_dimensions <- list(c("no", "yes"), c("no", "yes"))
names(matrix_dimensions) <- c("predicted", "actual")

error_cost <- matrix(c(0, 1,4, 0), nrow = 2,
                     dimnames = matrix_dimensions)

error_cost

credit_cost <- C5.0.default(credit_train[-17], credit_train$default,
                    costs = error_cost)
credit_cost
credit_cost_pred <- predict(credit_cost, credit_test)
CrossTable(credit_test$default, credit_cost_pred,
             prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
             dnn = c('actual default', 'predicted default'))

'*********************Ensemble Bagging*************************'
library(ipred)
set.seed(300)
mybag <- bagging(default ~ ., data = credit, nbagg = 25)
credit_pred <- predict(mybag, credit)
table(credit_pred, credit$default)

'********************Ensemble by Boosting method**************'
install.packages("adabag")
library(adabag)
set.seed(300)
adaboost_cv <- boosting.cv(default ~ ., data = credit)
adaboost_cv$confusion


'*********************Ensemble Bagging with K Fold technique, k =10*************************'
library(caret)
set.seed(300)
ctrl <- trainControl(method = "cv", number = 10)
train(default ~ ., data = credit, method = "treebag",
        trControl = ctrl)


str(svmBag)

svmBag$fit
svmBag$aggregate



bagctrl <- bagControl(fit = svmBag$fit,
                      predict = svmBag$pred,
                      aggregate = svmBag$aggregate)

set.seed(300)
svmbag <- train(default ~ ., data = credit, "bag",
                  trControl = ctrl, bagControl = bagctrl)

svmbag