Course Project
=============

Repository for Course Project files for the Getting and Cleaning Data course

Human Activity Recognition Using Smartphones Data Set
Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted Samsung smartphone with embedded inertial sensors. More details at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R program in R will download the original zipped Samsung data files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip,
read both test and training data text files from the zipped archive, combine into a tidy raw dataset file,
then generate a means summary for the means and standard deviation data, by subject and by activity, with the file name:
UCI HAR Dataset Means by Subject and Activity.txt according to the Hadley Wickham tidy dataset definitions at: http://vita.had.co.nz/papers/tidy-data.pdf

CodeBook.txt is the data dictionary for UCI HAR Dataset Means by Subject and Activity.txt
