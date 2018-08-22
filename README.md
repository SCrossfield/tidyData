# tidyData
Getting and Cleaning Data Assignment

run_analysis.R downloads a zip file of data as follows:
Title: Human Activity Recognition Using Smartphones Dataset, Version 1.0
Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Aim: transform the data as described in the Getting and Cleaning Data Assignment
First, required packages are installed (if not already) and loaded: tidyr, dplyr, reshape2
Second, the relevant files from the source zip file are read into R
Third, the steps defined in the assignment are undertaken:
1. Merge the test and train files
  a) There are three relevant files per test and train dataset (containing the activity label, subject ID and measures). These are bound together and then the test and train dataset are merged.
2. Extract the measurements on the mean and standard deviation for each measurement
  a) The column headers are defined in the 'features.txt' in the zip file. The corresponding columns ending in mean() or std() are subsetted, per activity label and subject ID. Note: other variable names included 'mean' but had no corresponding standard deviation and were excluded.
3. Give descriptive activity names to the activities in the data set
  a) The activity labels are numbers 1-6, corresponding to an activity string such as 'walking', as mapped in the 'activity_labels.txt' in the zip file.
  b) The numbers in the data set are replaced with the string to be more descriptive. This is achieved by merge(), to map the string across based on the corresponding number, and then the number is discarded.
4. Label the data set with descriptive variable names
  a) The variable names are listed in 'features.txt' in the zip file. The relevant variable names are assigned as column names using this file (except for the activity label and subject ID columns)
  b) The variable names are tidied to contain only alphanumerics, with each word in a variable starting with a capital letter except for the first word, which is expanded in full. Other words may remain in shorthand (for example, 'std' for 'standard deviation') to avoid overly long variable names. For full terms, see the code book
5. Create a tidy data set with the average of each variable
  a) The data has variable values (e.g. timeBodyAccMeanX) set as variable headers. This is corrected by gathering these columns to list the variable and its value, per activity label and subject ID, in a long table
  b) The data is then grouped by activity label and subject ID
  c) The average of each variable for each activity and each subject is then calculated
  d) Code is given for downloading the dataset for submission
