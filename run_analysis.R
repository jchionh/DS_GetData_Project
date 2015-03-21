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




