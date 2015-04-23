run_analysis <- function()
{

     ##################################################################
     # Prepare files before starting on the Course Project Assignment #
     ##################################################################
     
     # Set working directory ... (my working directory is commented out)
     # If nothing is set, then file will be downloaded to current working directory
     homedir <- "C:/Users/6220/Documents/C03-GettingCleaningData/CourseProj1"
     setwd(homedir)
     
     # Specify libraries used. Commented out install packages statement
     # install.packages("dplyr")
     # install.packages("plyr")
     library(dplyr)
     library(plyr)
     
     # Check if file has been downloaded to working directory
     # If not, the file is downloaded then unzipped
     
     urlloc <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     filename <- "getdata-projectfiles-UCI HAR Dataset.zip"

     if (!file.exists(filename)){
          download.file(url=urlloc, destfile=filename) 
          datedownload <- date()
          unzip(filename)
     }

     # Read the features.txt file (has the observation list)
     features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

     # Read the activity_labels.txt file
     activitylist <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
     
     # Read the X_test.txt, y_test.txt, subject_test.txt files
     testXdata <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
     testYdata <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
     testSubjectdata <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
     
     # Read the X_train.txt, y_train.txt, subject_train.txt files
     trainXdata <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
     trainYdata <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
     trainSubjectdata <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

     names(testXdata) <- features[,2]
     names(trainXdata) <- features[,2]
     names(testYdata) <- "activity"
     names(testSubjectdata) <- "subject"
     names(trainYdata) <- "activity"
     names(trainSubjectdata) <- "subject"
     
     #############################
     # Part One: Merge Data Sets #
     #############################
     
     # Add "subject" and "y" data sets to the corresponding "x" data sets
     testdata <- cbind(testYdata, testSubjectdata, testXdata)
     traindata <- cbind(trainYdata, trainSubjectdata, trainXdata)
     
     # Merge test and train data
     totaldata <- rbind(testdata, traindata)
     
     ####################################################
     # Part Two: Extract only mean and std measurements #
     ####################################################
     
     # first remove redundant columns (saw an error on select step due to this)
     totaldata <- totaldata[ !duplicated(names(totaldata)) ]
     
     # Select only columns that refer to mean or std measurements, as well as activity and subject
     newdata <- select(totaldata, contains("mean()", ignore.case=FALSE), contains("std()", ignore.case=FALSE), contains("activity", ignore.case=FALSE), contains("subject", ignore.case=FALSE))

     #########################################################
     # Part Three: Replace activity column number with names #
     #########################################################
     
     namedf <- data.frame("activityname"=activitylist$V2)
     activityreplace <- namedf$activityname[newdata$activity]
     newdata <- mutate(newdata, activity=activityreplace)  

     ##########################################################
     # Part Four: Label variable names with descriptive names #
     ##########################################################
     
     # Note that the variable names are already translated into the list from features.txt
     # So here, the variable names are going to be made more conventional in syntax
     # Basically "-" and the "() is removed. As well, std and mean are capitalized to show new word
     
     oldname <- names(newdata)
     partialname1 <- gsub("-", "", oldname)
     partialname2 <- gsub("std\\(\\)", "Std", partialname1)
     newname <- gsub("mean\\(\\)", "Mean", partialname2)
     
     names(newdata) <- newname

     ######################################################################################
     # Part Five: Create new data frame with calculated means based on activity & subject #
     ######################################################################################
     
     # using plyr package ddply, group based on activity and subject
     # then calculate mean based on columns
 
     tidydata <- ddply(newdata, .(activity, subject), numcolwise(mean))
     write.table(tidydata, file="finaltidydata.TXT", row.names=FALSE)

}