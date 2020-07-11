install.packages("qdap")
install.packages("qdapTools")


library(qdapTools)
library(tm)


files1 <-list.files("d:/data",pattern=".docx")
files1

count1 <-length(table(files1))
count1

files1[1]

name_file <- paste("d:/data/",files1[1],sep = "")
name_file

files1[11]

read_docx(paste("d:/data/ Good Requirement.docx"))
paste("d:/data/",files1[11],sep = "")
sprintf("d:/data/",files1[11])
data_1<- read_docx(paste("d:/data/",files1[11],sep = ""))
data_1                   
                   
                   

docx_data <- function (y) {return (read_docx(paste("d:/data/",y,sep = "")))}

data2 <-docx_data(files1[1])
data2

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