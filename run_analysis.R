createtidydata <- function(){

## Get features (list of colum names for data)
features <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", header = FALSE)
features <- features[,2] ## Set to list with single variable

## Get list of activity labels
actlabels <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", header = FALSE)
actlabels <- actlabels[,2] ## create list of just labels
actlabels <- unlist(actlabels) ## unlinst to allow labeling using activity code


## get the activity code from the file for train
trainact <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = "Activity")


## get the training data from the files
traindata <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = features)
traindata <- traindata[, 1:6] ## select relevant data (first 6 colums)

## get the subject for the train data
trainsubj <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "Subject")


## get the activity code from the file for test
testact <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "Activity")



## get the test data from the files
testdata <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = features)
testdata <- testdata[, 1:6] ## select relevant data (first 6 colums)

## get the subject for the test data
testsubj <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "Subject")


##Create composite data frame for train
tidytrain <- cbind(trainsubj, traindata, trainact)

##Create composite data frame for test
tidytest <- cbind(testsubj, testdata, testact)

## Merge the test and train data into one data frame
mergedata <- rbind(tidytest, tidytrain)

## create list of subjects and activity to use in aggregate function
subjectactivity <- c(as.list(mergedata["Subject"]), as.list(mergedata["Activity"]))

## Second data set with the average of each variable for each activity and each subject
avgtidydata <- aggregate(mergedata, by = subjectactivity, FUN = mean)

## create list of activities from new data set
actvities <- actlabels[avgtidydata[, 10]]

## replace activity codes with descriptive names
avgtidydata$Activity <- actvities

## Remove duplicate data
avgtidydata <- avgtidydata[, 2:9]


return(avgtidydata)
## Yes i know I dont HAVE to specify this as it was the last thing the
## function operated on but its an old habit and I feel better doing it

}





