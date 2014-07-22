Course Project
=============

Repository for Course Project files for the Getting and Cleaning Data course

##Summary
Human Activity Recognition Using Smartphones Data Set

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted Samsung smartphone with embedded inertial sensors. More details at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R program in R will download the original zipped Samsung data files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, read both test and training data text files from the zipped archive, combine into a tidy raw dataset file, then generate a means summary for the selected means and standard deviation data, by subject and by activity, with the file name: UCI HAR Dataset Means by Subject and Activity.txt according to the Hadley Wickham tidy dataset definitions at: http://vita.had.co.nz/papers/tidy-data.pdf

CodeBook.txt is the data dictionary for UCI HAR Dataset Means by Subject and Activity.txt

##run_analysis.R

The run_analysis.R program script does the following:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
