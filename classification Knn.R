

wbcd <- read.csv(file="D:/Personal/Data Science/R/data/wisc_bc_data.csv", stringsAsFactors=FALSE)
str(wbcd)
wbcd<- wbcd[-1]


wbcd$diagnosis<- factor(wbcd$diagnosis, levels= c("B", "M"), labels= c("Benign", "Malignant"))
table(wbcd$diagnosis)
round(prop.table(table(wbcd$diagnosis))*100, digit= 1)
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])


Normalize<- function (x) {return ((x-min(x))/diff(range(x)))}
wbcd_n <- as.data.frame(lapply(wbcd[2:31], Normalize))


wbcd_train<- wbcd_n[1:469, ]
wbcd_test<- wbcd_n[470:569, ]
wbcd_train_labels<- wbcd[1:469, 1]
wbcd_test_labels<- wbcd[470:569, 1]

wbcd_test_pred<- knn(train= wbcd_train, test= wbcd_test, cl= wbcd_train_labels, k= 21)
crosstable(x= wbcd_test_labesl, y= wbcd_test_pred, prop.chisq= FALSE)

wbcd_z <- as.data.frame(scale(wbcd[-1]))

wbcd_train<- wbcd_z[1:469, ]
wbcd_test<- wbcd_z[470:569, ]
wbcd_train_labels<- wbcd[1:469, 1]
wbcd_test_labels<- wbcd[470:569, 1]

table(wbcd_test_pred)
table(wbcd_test_labels)