# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Leave empty? not included in instructions. 
# Data Import and Cleaning
raw_df <- read.csv(file = "../data/week3.csv", header = TRUE)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- raw_df[format(raw_df$timeStart, "%Y-%m") != "2017-06", ]
clean_df <- clean_df[clean_df$q6 == 1,]
# Left empty, not included in instructions 
# Analysis 
clean_df$timeSpent <- difftime(clean_df$timeEnd, clean_df$timeStart, units = "secs")
clean_df$timeSpent <- as.numeric(clean_df$timeSpent); hist(clean_df$timeSpent)
frequency_tables_list <- lapply(clean_df[,5:14], table)
lapply(frequency_tables_list, barplot)
