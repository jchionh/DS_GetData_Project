# Code Book
This document explains the varriables in the output data set which the 
script `run_analysis.R` will create.

## Dataset Location
The output dataset is avaialble in a data frame called `avg_data` after the script is run.
A copy of the data set is also saved out to the file `tidy_data_set.txt` in the working directory.

## Variables

- `activity` the activity name from the possible values "WALKING", "WALKING UPSTAIRS", "WALKING DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

- `subject` the subject who performed the activity. a numeric id value from 1 to 30

- the rest of the varable names:
`tBodyAcc-mean()-X` `tBodyAcc-mean()-Y` `tBodyAcc-mean()-Z` `tBodyAcc-std()-X` `tBodyAcc-std()-Y` `tBodyAcc-std()-Z` `tGravityAcc-mean()-X` `tGravityAcc-mean()-Y` `tGravityAcc-mean()-Z` `tGravityAcc-std()-X` `tGravityAcc-std()-Y` `tGravityAcc-std()-Z` `tBodyAccJerk-mean()-X` `tBodyAccJerk-mean()-Y` `tBodyAccJerk-mean()-Z` `tBodyAccJerk-std()-X` `tBodyAccJerk-std()-Y` `tBodyAccJerk-std()-Z` `tBodyGyro-mean()-X` `tBodyGyro-mean()-Y` `tBodyGyro-mean()-Z` `tBodyGyro-std()-X` `tBodyGyro-std()-Y` `tBodyGyro-std()-Z` `tBodyGyroJerk-mean()-X` `tBodyGyroJerk-mean()-Y` `tBodyGyroJerk-mean()-Z` `tBodyGyroJerk-std()-X` `tBodyGyroJerk-std()-Y` `tBodyGyroJerk-std()-Z` `tBodyAccMag-mean()` `tBodyAccMag-std()` `tGravityAccMag-mean()` `tGravityAccMag-std()` `tBodyAccJerkMag-mean()` `tBodyAccJerkMag-std()` `tBodyGyroMag-mean()` `tBodyGyroMag-std()` `tBodyGyroJerkMag-mean()` `tBodyGyroJerkMag-std()` `fBodyAcc-mean()-X` `fBodyAcc-mean()-Y` `fBodyAcc-mean()-Z` `fBodyAcc-std()-X` `fBodyAcc-std()-Y` `fBodyAcc-std()-Z` `fBodyAccJerk-mean()-X` `fBodyAccJerk-mean()-Y` `fBodyAccJerk-mean()-Z` `fBodyAccJerk-std()-X` `fBodyAccJerk-std()-Y` `fBodyAccJerk-std()-Z` `fBodyGyro-mean()-X` `fBodyGyro-mean()-Y` `fBodyGyro-mean()-Z` `fBodyGyro-std()-X` `fBodyGyro-std()-Y` `fBodyGyro-std()-Z` `fBodyAccMag-mean()` `fBodyAccMag-std()` `fBodyBodyAccJerkMag-mean()` `fBodyBodyAccJerkMag-std()` `fBodyBodyGyroMag-mean()` `fBodyBodyGyroMag-std()` `fBodyBodyGyroJerkMag-mean()` `fBodyBodyGyroJerkMag-std()`
