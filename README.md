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
 
##Description of the variables in the finaltinydata.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.
 
Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.
 
