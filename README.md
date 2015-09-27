# README

## Description of Run_Analysis.R

The Run_Analysis.R file generates a tidy data set of the *Human Activity Recognition Using Smartphones Data Set*, found on the UCI machine learning repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  This file will work regardless of whether or not you have downloaded and unzipped the raw data.

### Required libraries

Run_Analysis.R requires the following libraries:

* Reshape2
* plyr

### Description of script

Run_Analysis.R performs the following steps:

1. Check to see if the current directory contains a zipped or unzipped version of the raw data set (found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
    * If there is an already unzipped version of the raw data, it proceeds to Step 2
    * If there is a zipped version of the raw data in the current directory, then it will unzip the raw data file before proceding to Step 2
    * If there is no raw data file (zipped or unzipped) in the current directory, then it will download and unzip it before proceding to Step 2.
2. Loads all the relevant raw data sets into R
3. Extracts only the measurements on the mean and standard deviation for each measurement
4. Assigns the appropriate activity name (walking, standing, etc.) to the corresponding activity number
5. Binds the test and train data sets together into one large data frame, *tidy_data*
    * Appropriate column names are assigned
    * The data set is ordered by subject number
    * Note: *tidy_data* is a loaded data frame in R.  We do not save it to a text file.

After creating the tidy data set as a data frame in R, the script then constructs the tidier data set that it will eventually save to a text file.

6. Melt and recast the *tidy_data* data frame into a data frame that averages all variables across activity and subject.
    * This new data frame is called *tidier_data*
7. Write the *tidier_data* frame to the text file "human_activity_monitor_tidy_data.txt".
    * This file is saved to your current working directory.