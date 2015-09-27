# Code Book

## Study Design

This data set is drawn from the *Human Activity Recognition Using Smartphones Data Set*, found on the UCI machine learning repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The following information about the study design is taken directly from the README.txt file that is included in the raw data set:

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.* 

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.* 

-------------------------------------
## Code Book
The following signals were measured.  For each signal, the mean and standard deviation of the measurements was recorded as separate variables.  Variables names which end in '-XYZ' is used to denote that three separate measurements were taken, one each in the X-, Y-, and Z-directions.  

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

For example, tBodyAcc-XYZ corresponds to 6 variables:

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z

### Notes about units: 
*(This information is found in the README.txt file that comes with the raw data sets)*

* The original units of linear acceleration measurements were in standard gravity units 'g'
* The original units of the angular acceleration measurements were in radians per second
* All measurements were subsequently normalized and bounded within [-1,1]
* The body linear acceleration and angular momentum information was derived in time in order to  obtain jerk signals.
