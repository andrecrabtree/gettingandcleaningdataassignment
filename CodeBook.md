# Code Book

This code book builds on the description of the data set provided with the source data. That information can be found in features_info.txt. It is recommended you read that before you read this description.

## mergedtidy.txt 
meredtidy.txt contains the output from steps 1-4 of the project.  

The first two columns are:

* **subject:** the subject from the original data set
* **activity:** a friendly name of the activity the subject performed. It is one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING. 

The remaining columns are the mean and standard deviation columns from the original data set. Please read features_info.txt from the original data set to understand how the original data points are generated. This script will keep only the variables mean() and std(). The base measurements are: 

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

For example: tBodyAcc-XYZ generates 6 variables in the mergedtidy.txt data set. These are: 

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z

Similar variables are generated for all the original data values. 

**NOTE:** there was a meanFreq() calculation done in the original data set that was not retained in this data set.

The data set is "wide" and each row represents the full collection of retained values for each subject & activity combination. Subjects performed each activity mulitple times. 

## mergedtidymeans.txt
mergedtidymeans.txt is the result of step 5 of the assignment.

The columns are:

* **subject:** the subject from the original data set.
* **activity:** a friendly name of the activity the subject performed. It is one of WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, or LAYING. 
* **variable:** the variable of which the mean was calculated.
* **mean:** the value of the mean calculation.

For example: subject 1 performing the activity WALKING generates multiple entries in the mergedtidy.txt data set. The mean of the tBodyAcc-mean()-X values was calculated over all those observations for mergedtidymeans.txt.

The mergedtidymeans.txt data set is a "narrow" data set. It can be converted to a "wide" data set by the use of the `cast()` function from the `reshape2` library.