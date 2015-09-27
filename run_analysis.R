require("plyr")     ## For the arrange command
require("reshape2") ## For the melt and dcast commands

file_name <-"getdata_projectfiles_UCI HAR Dataset.zip"
file_url  <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir_name  <-"getdata_projectfiles_UCI HAR Dataset"

## Check if the data set has already been downloaded and unzipped
##  1) If it has not been downloaded, then we download it and unzip it
##  2) If it has been downloaded but not unzipped, we only unzip it
##  3) If it has already been downloaded and unzipped, then we do nothing

if(!dir.exists(dir_name)){
    if(!file.exists(file_name)) {  
        download.file(file_url, file_name, method="libcurl")
    }
    unzip(file_name)
}

## Load all the relevent tables into R 

features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

## Construct a logical vector that only includes mean() and std() entries from 
##   the features data frame.  We need to exclude meanFreq() from being 
##   detected. We do this by only selecting entries that include "mean" where 
##   the next character is NOT the letter "F"

meanstd <- grepl("mean($|[^F])|std", features[,2])

## Use the newly created logical vector to subset X_test and X_train with the 
##   entries that refer to mean() and std() values.

X_test <- X_test[,meanstd]
X_train <- X_train[,meanstd]

## Replace the numbers in Y_test and Y_train with the corresponding acivities

for(i in 1:6){
    Y_train <- replace(Y_train, Y_train==i, as.character(activity_labels[i,2]))
    Y_test <- replace(Y_test, Y_test==i, as.character(activity_labels[i,2]))
}
Y_train[[1]] <- as.factor(Y_train[[1]])
Y_test[[1]] <- as.factor(Y_test[[1]])

## Begin constructing the data frame. We first add a new subject_type variable
##   to identify training subjects versus test subjects
subject_train <- cbind(subject_train, 
                       "subject_type" = rep("train", nrow(subject_train)))
subject_test <- cbind(subject_test, 
                      "subject_type" = rep("test", nrow(subject_test)))

## Now bind all the test and train data sets together.
subject <- rbind(subject_train, subject_test)
Y <- rbind(Y_train, Y_test)
X <- rbind(X_train, X_test)

## Bind the subject, X, and Y data sets together
tidy_data <- cbind(subject, Y, X)

## Rename all the columns.  We use the meanstd logical vector to extract the 
##   appropriate column names from the features data frame.
colnames(tidy_data) <- c("subject", "subject_type", "activity", 
                         as.character(features[meanstd,][[2]]))

## We will sort our data by the subject (requires plyr library)
tidy_data <- arrange(tidy_data, subject)

## Our tidy data set is created as the data frame "tidy_data". 

## ===========================================================
## Create the new data set that averages the variables by activity and subject
## We will use the melt and dcast commands for this procedure

id_names = c("subject", "subject_type", "activity")
measure_names = setdiff(colnames(tidy_data), id_names)
melted_data <- melt(tidy_data, id=id_names, measure.vars=measure_names)
tidier_data <- dcast(melted_data, activity + subject ~ variable, mean)

## Write our new data set to the file "human_activity_monitor_tidy_data.txt" 
##   in the current directory
write.table(tidier_data, file="./human_activity_monitor_tidy_data.txt", 
            row.name=FALSE)

