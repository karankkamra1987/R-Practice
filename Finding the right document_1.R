install.packages("qdap")
install.packages("qdapTools")


library(qdapTools)
library(tm)

Source_dir <- c("d:/data")
Find_word <- c("management")
mylist <-c("here is the list")

files1 <-list.files(Source_dir,pattern=".docx")
# files1
# 
# count1 <-length(table(files1))
# count1
# 
# files1[1]
# 
# name_file <- paste("d:/data/",files1[1],sep = "")
# name_file
# 
# files1[11]
# 
# read_docx(paste("d:/data/ Good Requirement.docx"))
# paste("d:/data/",files1[11],sep = "")
# sprintf("d:/data/",files1[11])
# data_1<- read_docx(paste("d:/data/",files1[11],sep = ""))
# data_1                   
#                    
 
count_occurence <- function (y) {
  (text_docx <- read_docx(paste("d:/data/",y,sep = "")))
  x <- length(grep("Find_word",text_docx))
  return(x) 
}

for (i in files1){
  x<- count_occurence(i)
  print(x)
  print(i)
if (x!=0){ mylist[[length(mylist)+1]] <- i }
}

mylist

# if (length(count_occurence)==0){ mylist[[length(mylist)+1]] <- y }
# 
 data2 <-docx_data(files1[1])
# data2
# 
 count_occurence <- grep("management",data2)
 length(count_occurence)
# str(count_occurence)

#if (length(count_occurence)==0){ mylist[[length(mylist)+1]] <- y }


lapply(files1,docx_data)



for(i in files1){ data1 <- cbind("d:/data/", i)
data1}

for(i in files1){ print(i)}

val <- LETTERS[1:4]
for ( i in val) {
  print(i)
}

str(val)
str(files1)