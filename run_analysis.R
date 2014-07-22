library("stringr")
library("sqldf")
library("plyr")

# a helping function to print to the console
pr <- function(...) {
  cat("[run_analysis.R]", ..., "\n")
}

dir <- getwd()
pr("Getting and Cleaning Data Project")
pr("Author: Jonah Wong")
pr("---")
pr("Starting up.")

# This section downloads the original data file and saves with the download date embedded within the file name
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dateDownloaded <- gsub(" ", "_", str_trim(date()))
fileName <- paste("Course_Project_",dateDownloaded,".zip")
pr("Downloading dataset from internet to: ", paste(dir,fileName))
download.file(fileUrl, destfile = fileName, method = "curl")

# Read the features table, 561 features labels
pr("  reading features labels...")
features_labels <- read.table(unz(fileName, "UCI HAR Dataset/features.txt"))

# Read the activity labels table, 6 activities labels
pr("  reading activities labels...")
activity_labels <- read.table(unz(fileName, "UCI HAR Dataset/activity_labels.txt"))

pr("Reading Test datasets.")
# Differentiate between Test or Training sets, 1 of 2 sets
Data_Set <- "Test"
pr("  reading Test measurements...")
# Read the 2947 test observations of 561 feature measurements, use the features labels as column names
test_x <- read.table(unz(fileName, "UCI HAR Dataset/test/X_test.txt"), col.names = features_labels$V2)
pr("  reading Test activities...")
# Read the 2947 test observations of the 6 activities, name the column "Activity"
test_y <- read.table(unz(fileName, "UCI HAR Dataset/test/y_test.txt"), col.names = "Activity")
pr("  reading Test subjects...")
# Read the 2947 test observations of the 30 subjects, name the column "ID"
test_subjects <-  read.table(unz(fileName, "UCI HAR Dataset/test/subject_test.txt"), col.names = "ID")
pr("  naming Test activities...")
# Convert the Activity column to 6 level factor, using the activity labels as names
test_y$Activity <- factor(test_y$Activity, levels = 1:6, labels = activity_labels$V2)
pr("Combining Test datasets.")
# Combine the test set, test subjects, activity measured, and the 561 meaurements = 2947 x  (1 + 1 + 1 + 561 =) 564
test_set <- cbind(Data_Set,test_subjects,test_y,test_x)

pr("Reading Training datasets.")
# Differentiate between Test or Training sets, 2 of 2 sets
Data_Set <- "Training"
pr("  reading Training measurements...")
# Read the 7352 training observations of 561 feature measurements, use the features labels as column names
train_x <- read.table(unz(fileName, "UCI HAR Dataset/train/X_train.txt"), col.names = features_labels$V2)
pr("  reading Training activities...")
# Read the 7352 training observations of the 6 activities, name the column "Activity"
train_y <- read.table(unz(fileName, "UCI HAR Dataset/train/y_train.txt"), col.names = "Activity")
pr("  reading Training subjects...")
# Read the 7352 training observations of the 30 subjects, name the column "ID"
train_subjects <-  read.table(unz(fileName, "UCI HAR Dataset/train/subject_train.txt"), col.names = "ID")
pr("  naming Training activities...")
# Convert the Activity column to 6 level factor, using the activity labels as names
train_y$Activity <- factor(train_y$Activity, levels = 1:6, labels = activity_labels$V2)
pr("Combining Training datasets.")
# Combine the training set, training subjects, activity measured, and the 561 meaurements = 7352 x (1 + 1 + 1 + 561 =) 564
train_set <- cbind(Data_Set,train_subjects,train_y,train_x)

pr("Joining datasets.")
# Merging the training and test data sets per project specification #1, 2947 + 7352 = 10299 x 564
combined_set <- rbind(test_set,train_set)
pr("Selecting features")
# selects the desired variables, according to project specification #2, any mean or standard deviation measurements.
# Or, any features label variable name with the string "ean" ("mean" or "Mean") or "std", 86 of 561 selected.
feature_labels_select <- subset(features_labels, grepl("std", features_labels$V2) | grepl("ean", features_labels$V2))
# The merged set, with the mean and standard deviation extracted measurements is: 10299 x (3 + 86 =) 89
combined_set_select <- combined_set[,c(1:3, 3+feature_labels_select$V1)]

pr("Splitting by activity and subject, applying mean to all the measurements, and combining to a new tidy dataset")
# The second data set with the mean of each extracted measurements is (30 subjects by 6 activities =) 180 x 89
tidy_set <- ddply(combined_set_select,.(Activity,ID),numcolwise(mean, na.rm= TRUE))
tidyFile <- "UCI HAR Dataset Means by Subject and Activity.txt"
pr("Saving tidy data to:", paste(dir,tidyFile))
write.table(tidy_set, file=tidyFile)
