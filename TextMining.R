
#####################################################
## 문제 1 rJava, DBI, RJDBC, dplyr
## 패키지를 호출하시오
#######################################################
library(rJava)
library(DBI)
library(RJDBC)
library(XML)
library(memoise)
library(KoNLP)
library(wordcloud)
library(dplyr)
library(ggplot2)
library(ggmap)
library(rvest)
library(RColorBrewer)
library(data.table)
library(reshape)
library(stringr)
library(reshape)
library(RColorBrewer)
library(data.table)

KoNLP::useSejongDic()
dSeoulNew <- readLines("seoul_new.txt")
dSeoulNew
class(dSeoulNew)
dSeoulNew <- sapply(dSeoulNew, extractNoun, USE.NAMES = T) # 명사추출
class(dSeoulNew)
head(dSeoulNew)
class(dSeoulNew)
dSeoulNew <- gsub("\\d+","",dSeoulNew) # 숫자제거
class(dSeoulNew)
head(dSeoulNew)
dSeoulNew <- unlist(dSeoulNew)
write(dSeoulNew, "seoul_new2.txt") # 공백제거
dSeoulNew <- read.table("seoul_new2.txt")

