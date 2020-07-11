library(readr)
install.packages("syuzhet")
#"load data"
happy<-  read_lines("D:/Personal/Data Science/R/Data/Twitter-Sentimental-Analysis-master/Twitter-Sentimental-Analysis-master/happy.txt")
sad <-  read_lines("D:/Personal/Data Science/R/Data/Twitter-Sentimental-Analysis-master/Twitter-Sentimental-Analysis-master/sad.txt")


happy_test <-  read_lines("D:/Personal/Data Science/R/Data/Twitter-Sentimental-Analysis-master/Twitter-Sentimental-Analysis-master/happy_test.txt")
sad_test <-  read_lines("D:/Personal/Data Science/R/Data/Twitter-Sentimental-Analysis-master/Twitter-Sentimental-Analysis-master/sad_test.txt")

str(happy)
str(happy_test)
str(sad)
str(sad_test)



tweet = c(happy, sad)
tweet_test= c(happy_test, sad_test)
tweet_all = c(tweet, tweet_test)


sentiment = c(rep("happy", length(happy) ), 
              rep("sad", length(sad)))
sentiment_test = c(rep("happy", length(happy_test) ), 
                   rep("sad", length(sad_test)))


str(happy)
str(happy_test)
str(sad)
str(sad_test)


sentiment_all = as.factor(c(sentiment, sentiment_test))

nrow(sentiment_all)

library(RTextTools)
#First, try naive Bayes.

# naive bayes
mat= create_matrix(tweet_all, language="english", 
                   removeStopwords=FALSE, removeNumbers=TRUE, 
                   stemWords=FALSE, tm::weightTfIdf)



mat = as.matrix(mat)
str(mat)
nrow(mat)
ncol(mat)  

mat[1:1]


classifier = naiveBayes(mat[1:160,], as.factor(sentiment_all[1:160]))
predicted = predict(classifier, mat[161:180,]); predicted

table(sentiment_test, predicted)
recall_accuracy(sentiment_test, predicted)
#Then, try the other methods:
  
  # the other methods
  mat= create_matrix(tweet_all, language="english", 
                     removeStopwords=FALSE, removeNumbers=TRUE, 
                     stemWords=FALSE, tm::weightTfIdf)

container = create_container(mat, as.numeric(sentiment_all),
                             trainSize=1:160, testSize=161:180,virgin=FALSE) #????????????removeSparseTerms

models = train_models(container, algorithms=c("MAXENT",
                                              "SVM",
                                              #"GLMNET", "BOOSTING", 
                                              "SLDA","BAGGING", 
                                              "RF", # "NNET", 
                                              "TREE" 
))

# test the model
results = classify_models(container, models)
table(as.numeric(as.numeric(sentiment_all[161:180])), results[,"FORESTS_LABEL"])
recall_accuracy(as.numeric(as.numeric(sentiment_all[161:180])), results[,"FORESTS_LABEL"])


# formal tests
analytics = create_analytics(container, results)
summary(analytics)


head(analytics@algorithm_summary)
head(analytics@label_summary)
head(analytics@document_summary)
analytics@ensemble_summary # Ensemble Agreement

# Cross Validation
N=3
cross_SVM = cross_validate(container,N,"SVM")
cross_GLMNET = cross_validate(container,N,"GLMNET")
cross_MAXENT = cross_validate(container,N,"MAXENT")