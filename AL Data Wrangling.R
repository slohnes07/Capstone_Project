install.packages("dplyr")
library("dplyr")
install.packages("tidyr")
library("tidyr")
install.packages("readr")
library("readr")
summary(AL_data_ALL)
str(AL_data_ALL)
AL_data_ALL <- tbl_df(AL_data_ALL)
str(AL_data_ALL)
head(AL_data_ALL)

# Need to remove first column, last column, and last rows
AL_data_ALL <- AL_data_ALL[,-1]
head(AL_data_ALL)

AL_data_ALL <- AL_data_ALL[-c(46:53),]

AL_data_ALL <- AL_data_ALL[,-41]

# Need to rename columns

AL_data_ALL <- rename(AL_data_ALL, Ethnicity = X)
head(AL_data_ALL)
names(AL_data_ALL) <- gsub(x = names(AL_data_ALL), 
                           pattern = "\\.", 
                           replacement = " ")
head(AL_data_ALL)
AL_data_ALL_2016 <- AL_data_ALL

# Gather subject columns 
AL_data_ALL2 <- gather(AL_data_ALL_2016, "Subject", 
                       "Number of Exams", 4:40)
AL_data_ALL_2016 <- AL_data_ALL2

# Add a State Column and add values

AL_data_ALL_2016$State <- "AL"

# Remove Total Exams Column

AL_data_ALL_2016 <- AL_data_ALL_2016[,-3]

# Sort data by Ethinicity Column

AL_data_ALL_2016 <- AL_data_ALL_2016[order(AL_data_ALL_2016$Ethnicity),]

# Convert Number of Exams Column to Numeric & Replace NAs

AL_data_ALL_2016$`Number of Exams` <- as.numeric(AL_data_ALL_2016$`Number of Exams`)

AL_data_ALL_2016$`Number of Exams`[is.na(AL_data_ALL_2016$`Number of Exams`)] <- 0

# Rename AP SCORE Column

AL_data_ALL_2016 <- rename(AL_data_ALL_2016, Score = "AP SCORE")
