#########################################################################################
# ASSUMPTION:
# 
# That the dataset is already downloaded, and unzipped into a sub directory called
# "UCI HAR Dataset" in the worling directory.
#
# the zipped dataset can be obtained from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#########################################################################################

## 1. Merges the training and the test sets to create one data set.

# let's read the training set
train_x <- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE)
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors=FALSE)
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors=FALSE)
# now, merge to get the training set
train_data <- cbind(train_y, train_subject, train_x)

# let's read the test set
test_x <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE)
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors=FALSE)
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors=FALSE)
# now, merge to get the test data set
test_data <- cbind(test_y, test_subject, test_x)

# now, merge both the test and train data to get the fully merged data
merged_data <- rbind(train_data, test_data)

# assign column names to the merged data
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
names(merged_data) <- c("activity", "subject", features$V2)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# identify only the column names with mean() or std()
sel_features <- features$V2[grep("(mean|std)\\(", features$V2)]
# reduce our merged data to only the features we want -- mean() and std()
merged_data <- merged_data[,c("activity", "subject", sel_features)]

## 3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
# merge both data and activity labels on the coded activity number (V1), as a first step 
merged_data <- merge(merged_data, activities, by.x = "activity", by.y = "V1")
# now, assign the activity column the values of the V2, which is the description of the activity
merged_data <- within(merged_data, activity <- V2)
# now we can drop the V2 column
merged_data$V2 <- NULL

## 4. Appropriately labels the data set with descriptive variable names. 

# already done this in Part 1 with the following commands
# assign column names to the merged data
# features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
# names(merged_data) <- c("activity", "subject", features$V2)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
##    each variable for each activity and each subject.

# create the avg_data frame and compute the first column (the third) of numeric data "tBodyAcc-mean()-X"
# so that we have a data frame that exist with the first column of numeric average data done
# and have the correct number of rows with average values
avg_data <- aggregate(formula = merged_data[,3] ~ merged_data$activity + merged_data$subject, data = merged_data, FUN = mean)

# now, do the same for the next column (fourth) to the last column
for (column in 4:ncol(merged_data)) {
  # assign the next column the value of the average when we aggregated by activity and subject, the average of the values
  # we use [,3] at the end, because the computed average is the 3rd column of this aggregate
  avg_data[,column] <- aggregate(formula = merged_data[,column] ~ merged_data$activity + merged_data$subject, data = merged_data, FUN = mean)[,3]
}

# now assign the column names to avg_data
names(avg_data) <- names(merged_data)
# then sort them nicely by activity and subject
avg_data <- arrange(avg_data, activity, subject)
# write the table out to file
write.table(avg_data, file = "./tidy_data_set.txt", row.name=FALSE)

