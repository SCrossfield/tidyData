# First, download the zip file to a temp file
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
tempzip <- tempfile()
download.file(fileUrl, tempzip)

#also install and load the relevant libraries
if(!require("tidyr")) {install.packages("tidyr")}
if(!require("dplyr")) {install.packages("dplyr")}
if(!require("reshape2")) {install.packages("reshape2")}
library(dplyr)
library(tidyr)
library(reshape2)

# Then read in the tables for train and test data, activity labels and column names
traindata <- read.table(unz(tempzip, "UCI HAR Dataset/train/X_train.txt"))
trainlabel <- read.table(unz(tempzip, "UCI HAR Dataset/train/y_train.txt"))
subjecttrain <- read.table(unz(tempzip, "UCI HAR Dataset/train/subject_train.txt"))

testdata <- read.table(unz(tempzip, "UCI HAR Dataset/test/X_test.txt"))
testlabel <- read.table(unz(tempzip, "UCI HAR Dataset/test/y_test.txt"))
subjecttest <- read.table(unz(tempzip, "UCI HAR Dataset/test/subject_test.txt"))

dcolnames <- read.table(unz(tempzip, "UCI HAR Dataset/features.txt"))
dcolnames<- dcolnames[,2] #second column has variable names

# 1. Merge the test and train files
#first, name and add the activity label and subject ID, in case the row order changes during merging
names(trainlabel)<- "activity"
names(testlabel) <- "activity"
names(subjecttrain) <- "subjectID"
names(subjecttest) <- "subjectID"

activitytrain <- cbind(trainlabel, subjecttrain, traindata)
activitytest <- cbind(testlabel, subjecttest, testdata)

# now merge the test and train files
mdata<-rbind(activitytrain, activitytest)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# this is identified as: columns with names in the 'features.txt' ending in mean() or std()
# (i.e. those mean measures that have matching std measurements)
meanstd<- mdata[,c(1:8, 43:48, 83:88, 123:128, 163:168, 203, 204, 216, 217, 229, 230, 
                   242, 243, 255, 256, 268:273, 347:352, 426:431, 505, 506, 518, 519,
                   531, 532, 544, 545)]

# 3. Give descriptive activity names to the activities in the data set
#first read in the labels
activitylabel <- read.table(unz(tempzip, "UCI HAR Dataset/activity_labels.txt"))
#then add the labels
labelled<- merge(activitylabel, meanstd, by.x="V1", by.y ="activity")
#discard the activity number (now that we have activity label too)
labelled<-labelled[,2:69]

# 4 Label the data set with descriptive variable names
#subset the relevant header names - they match the zipped files for easy reference
meanstdcolnames<-dcolnames[c(1, 1, 1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 
                             240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517,
                             529, 530, 542, 543)]
#assign these to the columns
colnames(labelled) <- meanstdcolnames
#set the name of the first columns, which have activity label and subject ID
colnames(labelled)[1] <- "activityLabel"
colnames(labelled)[2] <- "subjectID"
#tidy the other variable names by removing non-alphanumeric characters 
#and set a Capital letter at the start of each word for ease of reading
#and expand the first letter into the appropriate word (for other shorthand, see code-book)
names(labelled)<-gsub("\\()", "", names(labelled))
names(labelled) <- gsub("-", "", names(labelled))
names(labelled)<-gsub("mean", "Mean", names(labelled))
names(labelled) <- gsub("std", "Std", names(labelled))
names(labelled) <- gsub("^t", "time", names(labelled))
names(labelled) <- gsub("^f", "frequency", names(labelled))

# 5. Create a tidy data set with the average of each variable 
  #  for each activity and each subject

#where the column headers are values (e.g. timeBodyAccMeanX) rather than variable names, gather these
#then group by activity and subject
#save as 'longdata'
labelled %>% 
  gather(value, unit, -activityLabel, -subjectID) %>%
  group_by(activityLabel, subjectID) %>%
  {.} -> longdata

# calculate the average of each variable for each activity and each subject
tidydata<-aggregate(longdata[,4], list(longdata$activityLabel, longdata$subjectID, longdata$value), mean)
#assign headers
colnames(tidydata) <- c("activityLabel", "subjectID", "variable", "mean")

#download the tidy data for submission
write.table(tidydata, file="tidyData.txt", row.names=FALSE)


