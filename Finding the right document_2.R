library(qdapTools)
library(tm)

Source_dir <- c("d:/data/")
words_list <- c("transformation")
mylist <-c("here is the list")

files1 <-list.files(Source_dir,pattern=".docx")
files1

count_occurence <- function (y,z) {
  print(paste(Source_dir,y,sep = ""))
  (text_docx <- read_docx(paste(Source_dir,y,sep = "")))
 
  x <- length(grep(z,text_docx))
  print(x)
  return(x) 
}
for(Find_word in words_list){                    
 
for (i in files1){
  print(i)
  x<- count_occurence(i,Find_word)
   print(x)
   
if (x!=0){ mylist[[length(mylist)+1]] <- paste(Find_word, i)}
}}

mylist