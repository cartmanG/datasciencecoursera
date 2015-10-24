# You should create one R script called run_analysis.R that does the following. the average of each variable for each activity and each subject.

library(plyr)

#PART ONE
# Merges the training and the test sets to create one data set.

#a) read in data files using read.table
x_train <- read.table("train/x_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/x_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#b) combine the test and train data sets
x_data <- rbind(x_train,x_test)
y_data <- rbind(y_train,y_test)
subject_data <- rbind(subject_train, subject_test)

#PART TWO
# Extracts only the measurements on the mean and standard deviation for each measurement. 

#a) read in features table to find out which part of data is mean and standard deviation
features <- read.table("features.txt")

#b) get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[,2])

#c) subset the desired columns from x_data
x_data <- x_data[, mean_and_std_features]

#d) change the column names with the names from features
names(x_data) <- features[mean_and_std_features, 2]

#PART THREE
# Uses descriptive activity names to name the activities in the data set

#a) read in activity labels
activities <- read.table("activity_labels.txt")

#b) update the y_data table with the activity labels
y_data[,1]<- activities[y_data[,1],2]

#c) change the column name
names(y_data) <- "activity"

#PART FOUR
# Appropriately labels the data set with descriptive variable names. 

#a) change the column name
names(subject_data) <- "subject"

#b) combine x, y and subject data into a single data set
all_data <- cbind(x_data,y_data,subject_data)

#PART FIVE
# From the data set in step 4, creates a second, independent tidy data set with 

#a) get average of each column of data using ddply and colmeans functions
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

#b) output the function
write.table(averages_data, "averages_data.txt", row.name=FALSE)