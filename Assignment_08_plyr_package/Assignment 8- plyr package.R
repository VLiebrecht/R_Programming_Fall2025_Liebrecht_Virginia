#1.Import Assignment 6 Data
student6 <- read.table(file.choose(), header = TRUE, stringsAsFactors = FALSE, sep = ",") #Added ',' to split the values for analysis
student6
##1.1 Load plyr and comput mean of Grade by Sex:
library(plyr)
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)
##1.2 Write the grouped means to the text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

#2 Filter Names containing "i"
##2.1 Select rows where Name contains "i" or "I"
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)
##2.2 Extract just the names and write them to a CSV
write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)
#3 Export Filtered Dataset 
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)

#3.1 Confirm files were made  
getwd()

list.files()
