# Introduction

The raw data for this assignment is from the 
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"> UCI Machine Learning Repository </a>
with dataset found <a href= "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"> here </a>

The repository containes files for the Course Project 1 assignment from Coursera/John Hopkins Data Science Specialization Class on Getting and Cleaning Data.

## Project Description
The original data has several data files that describe smartphone accelerometor and gyroscope signals.
There are two data sets that describe different "sessions" in which this data is taken (called "test" and "train" sessions).
In each session, there are total of 6 activities and up to 30 subjects total that give data.
There is a total number of 561 accelerometer, gyroscope and further extracted data variables in the raw data.

From the raw data, the ultimate goal is to create a subset of tidy data, created with the following steps:

1. MERGE DATA: Multiple data files from the test and training sessions are merged into one dataset.
2. SELECT DATA: Only variables with mean and standard deviation in the variable names are selected.
3. RENAME DATA WITH DESCRIPTIVE LABEL: The activity names are inserted into the dataset, replacing numerical values that represent said activities.
4. RENAME VARIABLES: The data variables are changed with specific "tidy data principles"
5. CREATE FINAL TIDY DATASET: Lastly a tidy data set is created describing the mean of each mean or standard deviation variables for each activity and subject.

##Study design and data processing

Below gives more details for each of the steps outlined in the project description.
 
###1. MERGE DATA
The raw data used is saved in two folders "./UCI HAR Dataset/test" and "./UCI HAR Dataset/train".

The test folder has three text files, labeled: "subject_test.txt", "X_test.txt", "y_test.txt"

The train folder has three text files, labeled: "subject_train.txt", "X_train.txt", "y_train.txt"

Initial data is read into files.
For each test and training sessions, the three files are merged using cbind() function.
The "./UCI HAR Dataset/test/X_test.txt" and "./UCI HAR Dataset/train/X_train.txt" files are renamed with the variable names from the "./UCI HAR Dataset/features.txt" file

We label the names of "./UCI HAR Dataset/test/subject_test.txt" and "./UCI HAR Dataset/train/subject_train.txt" with "subject"

We label the names of "./UCI HAR Dataset/test/y_test.txt" and "./UCI HAR Dataset/train/y_train.txt" with "activity"

Then the test and train data are merged using the rbind() function.
Here, we assume that the same subject ids in the test and training sessions correspond to the same person.

###2. SELECT DATA
We need to remove duplicate columns/variables.

As only the mean and standard deviation measurements are required for the final tidy dataset, we only take the columns with variable names including mean() and std().
 
Here, we assume that the meanFreq() is not used in the tidy dataset.
 
###3. RENAME DATA WITH DESCRIPTIVE LABEL
The activity column contains numeric values corresponding to one of six activities.
Here, we replace the numeric value with the string, with the mapping found in "./UCI HAR Dataset/activity_labels.txt"

###4. LABEL VARIABLES
The variable names from the raw dataset are changed in this section.
We use a free tidy data principles, namely removing non-alphanumeric characters: "()" and "-"
Then the variable names capitalize each new word for slightly easier reading.

###5. CREATE FINAL TIDY DATASET
The final tidy dataset requirement is to group the data by activity and subject.
Then take the mean of each variable.

We use the ddply function in order to this. The final tidy dataset is written to a file and uploaded to the Github repo.
 
##Description of the variables in the finaltinydata.txt file
The finaltidydata.txt file has the follwowing attributes:
 - Dimensions of the dataset: 180 rows (30 subjects x 6 activities) and 68 variables (those with mean() and std() from raw data as well as one variable for activity, one for subject)
 - Variables present in the dataset: Variables are desribed in the CodeBook.txt. There is one variable for the activity, one for subject and the remaining 66 for the mean of each variable
 
