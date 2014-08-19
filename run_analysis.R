## make sure the packages are installed, install if necessary
pkg <- c("plyr", "reshape2")
new.pkg <- pkg[!(pkg %in% installed.packages())]
if (length (new.pkg)) {
  install.packages (new.pkg)
}

## load libraries
library(plyr)
library(reshape2)

## Set up some variables
datadir <- "UCI HAR Dataset/"
activity.labels.filename <- paste (datadir, "activity_labels.txt", sep="")
features.filename <- paste (datadir, "features.txt", sep="")
training.filename <- paste (datadir, "train/X_train.txt", sep="")
training.subject.filename <- paste (datadir, "train/subject_train.txt", sep="")
training.activity.filename <- paste (datadir, "train/y_train.txt", sep="")
testing.filename <- paste (datadir, "test/X_test.txt", sep="")
testing.subject.filename <- paste (datadir, "test/subject_test.txt", sep="")
testing.activity.filename <- paste (datadir, "test/y_test.txt", sep="")
mergedtidy.out <- "mergedtidy.txt"
mergedtidymeans.out <- "mergedtidymeans.txt"

## load the files for processing
## lets load them in and see what we have
activity.labels <- read.table(activity.labels.filename)
features <- read.table(features.filename)
training <- read.table(training.filename)
training.subject <- read.table(training.subject.filename) # who did the activity
training.activity <- read.table(training.activity.filename) # what was the activity
testing <- read.table(testing.filename)
testing.subject <- read.table(testing.subject.filename) # who did the activity
testing.activity <- read.table(testing.activity.filename) # what was the activity

## Objective 1
## add the subject and activity columns
training.complete <- cbind(training.subject, training.activity, training)
testing.complete <- cbind(testing.subject, testing.activity, testing)

## lets smoosh the training and test sets together
combined <- rbind (training.complete, testing.complete)

## Objective 4
## add the column names
colnames (combined) <- c("subject", "activity", as.character(features[,2]))

## Objective 3
## turn activities into descriptive names
combined$activity <- factor (combined$activity, labels=activity.labels[,2])
## subject should be a factor as well, not an integer
combined$subject <- as.factor(combined$subject)

## Objective 2
## grep for mean and std in the features
colstokeep <- grep ("mean[^F]|std", features[,2], value=TRUE)
## add subject and activity back in
colstokeep <- c("subject", "activity", colstokeep)
kept <- combined [, names(combined) %in% colstokeep]


## write this file out, even though it does not appear that the assignment requires that. 
write.table (kept, mergedtidy.out, row.names=FALSE)


## Objective 5
## it is split-apply-combine approach 
## melt the kept table
melted <- melt (kept, id.vars=c("subject","activity"))
averaged<-ddply (melted, c("subject","activity","variable"), summarize, mean=mean(value))
## now write out the table
write.table (averaged, mergedtidymeans.out, row.names=FALSE)

