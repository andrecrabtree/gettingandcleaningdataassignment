# Getting and Cleaning Data Assignment

## How to use the run_analysis.R script

First you will need to download the data for the project. 
You can get it [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Uncompress the zip directory that the `run_analysis.R` script will be in. The archive will decompress into a folder called 'UCI HAR Dataset'. This name is important as it's encoded in the `run_analysis.R` script. If you place the data files elsewhere you will have to change `run_analysis.R`.

Once you've uncompressed the file you can simple source the run_analysis.R script. It will:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.  

The merged tidy data set (result of steps 1-4) is a file in the base directory called mergedtidy.txt. 

The tidy data set (result of step 5) is a file in the base directory called mergedtidymeans.txt. It is a "narrow" data set. 

The script uses the `plyr` and `reshape2` libraries. If you don't have them installed already the script will install them for you.