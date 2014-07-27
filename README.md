Get-and-clean-data
==================

Used for my coursera course on getting and cleaning data.

All files is this repo relate to the assignment Getting and Cleaning Data Course Project.

 	run_analysis.R is a script that will access data from the files located here:
 	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 	
It will combine the 2 data sets (Test and Train),  extract only the measurements on the mean and standard deviation for each measurement, then calculate the average for each reading and present the data grouped by activity completed and subject.

To do this it starts by reading the test and training into separate data frames. Then it formats each before it appends the training data onto the test data and it stores the result in mergedata.

The last part of the function creates 2 lists of the subject and activity for each set of measurements, then calculates the average for each case and stores the result in avgtidydata which is the output for the function.
