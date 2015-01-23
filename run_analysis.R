url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data/DataSet.zip")) {
    download.file(url, destfile="C:/Pearson/Coursera/Cleaning Data/data/DataSet.zip")
    unzip("C:/Pearson/Coursera/Cleaning Data/data/DataSet.zip", exdir="./data")    
}

# Read training data
x_trainingSet <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_trainingLabels <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainingSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_testSet <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_testLabels <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# 1. Merges the training and the test sets to create one data set.
mergedData <- rbind(x_trainingSet, x_testSet)
featureNames <- read.table("./data/UCI HAR Dataset/features.txt")[, 2]

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
names(mergedData) <- featureNames
mean_std_index <- grep("(mean|std)\\(\\)", names(mergedData))
mean_std_mergedData <- mergedData[,mean_std_index ]

# 3. Uses descriptive activity names to name the activities in the data set
mergedLabels <- rbind(y_trainingLabels, y_testLabels)[,1]

# 4. Appropriately labels the data set with descriptive variable names. 
activityNames <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
activities <- activityNames[mergedLabels]

subjects <- rbind(trainingSubject, testSubject)[, 1]

clean_data <- cbind(Subject = subjects, Activity = activities, mean_std_mergedData)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
cleanMeans <- ddply(clean_data, .(Subject, Activity), summarize,  means = colMeans(clean_data[, 3:68]))

# Write file
write.table(cleanMeans, "./data/cleanMeans.txt", row.names = FALSE)


