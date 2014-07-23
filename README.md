Course Project
=============

Repository for Course Project files for the Getting and Cleaning Data course

##Summary
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Abstract:** Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted Samsung smartphone with embedded inertial sensors.

run_analysis.R program in R will download the original zipped Samsung data files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, read both test and training data text files from the zipped archive, combine into a tidy raw dataset file, then generate a means summary for the selected means and standard deviation data, by subject and by activity, with the file name: UCI HAR Dataset Means by Subject and Activity.txt according to the [Hadley Wickham tidy dataset](http://vita.had.co.nz/papers/tidy-data.pdf) definitions.

CodeBook.txt is the data dictionary for UCI HAR Dataset Means by Subject and Activity.txt

##run_analysis.R

The run_analysis.R program script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the script

To run the script, in the Console windoow of RStudio, check your working directory with the getwd() command, and use setwd(working.dir) to working.dir appropriately. Copy the script to working.dir and use the command: source('run_analysis.R'). 

During program execution, you will see the following output as the script works:

```
[run_analysis.R] Getting and Cleaning Data Project
[run_analysis.R] Author: Jonah Wong
[run_analysis.R] --- 
[run_analysis.R] Starting up. 
[run_analysis.R] Downloading dataset from internet to:  working.dir/Course_Project_ Current Date and Time .zip

...... Downloading File information .......

[run_analysis.R]   reading features labels... 
[run_analysis.R]   reading activities labels... 
[run_analysis.R] Reading Test datasets. 
[run_analysis.R]   reading Test measurements... 
[run_analysis.R]   reading Test activities... 
[run_analysis.R]   reading Test subjects... 
[run_analysis.R]   naming Test activities...
[run_analysis.R] Combining Test datasets. 
[run_analysis.R] Reading Training datasets. 
[run_analysis.R]   reading Training measurements... 
[run_analysis.R]   reading Training activities... 
[run_analysis.R]   reading Training subjects... 
[run_analysis.R]   naming Training activities...
[run_analysis.R] Combining Training datasets. 
[run_analysis.R] Joining datasets. 
[run_analysis.R] Selecting features 
[run_analysis.R] Splitting by activity and subject, applying mean to all the measurements, and combining to a new tidy dataset 
[run_analysis.R] Saving tidy data to: working.dir/UCI HAR Dataset Means by Subject and Activity.txt 
```

## Process

1. Get the list of activities.
2. Get the list of subjects.
3. For both the test and train datasets, produce an interim dataset:
**3. Put the activity labels (not numbers) into the interim dataset.
**3. Put the subject IDs into the interim dataset.
4. Join the test and train interim datasets.
5. Extract the mean and standard deviation features. This is the selected dataset.
6. Split the selected dataset, applying the mean function to each vector of values in each subject/activity pair. This is the clean dataset.
7. Write the clean dataset to disk.
