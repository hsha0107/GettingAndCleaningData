## for simplicity, put all the necessary txt files in the same (working) directory
## read & combine data from test set & train set(step 1)

testdt <- read.table("X_test.txt")
traindt <- read.table("X_train.txt")
data_set <- rbind(testdt,traindt)
##rm("testdt") ## remove objects to avoid confusion if needed
##rm("traindt")

## read data from features.txt to get names of variables, stored data in a vector
## indices contain the indices of columns with measurements on the mean or standard deviation
## rewrite the data set with only measurements on the mean or standard deviation (step 2)

var_name <- read.table("features.txt")[,2]
indices <- grep(("mean\\()|std\\()"), var_name)
data_set <- data_set[,indices]

## read data from activity_labels.txt to get descriptive names for corresponding activity labels
## then, read and combine labels of activity for every observation in test set & train set
## stored data in a vector

label_name <- as.character(read.table("activity_labels.txt")[,2])
ytest <- read.table("y_test.txt")
ytrain <- read.table("y_train.txt")
activity_label <- rbind(ytest,ytrain)[,1]
##rm("ytest")
##rm("ytrain")

## get an activity vector which stores descriptive activity names for all the observations

activity <- character()
for(i in activity_label){
     activity <- append(activity, label_name[i])
}

## read and combine data of subject who performed the activity for every observation 
## in test set & train set, stored data in a vector

testsbj <- read.table("subject_test.txt") 
trainsbj <- read.table("subject_train.txt") 
subjectID <- rbind(testsbj,trainsbj)[,1]
##rm("testsbj")
##rm("trainsbj")

## combine the measurement data set with subjectID and activity
## 1st & 2nd column now indicate the subject performs the activity & 
## descriptive name of performed activity for each observation (step 3)

data_set <- cbind(subjectID, activity, data_set)

## edit the variable names to be more descriptive
## the original descriptive variable names are taken from features.txt
## new variable names should only include letters, numbers or "." & duplicate is removed
## then, apply these names to the current variable names of the data set (step 4)

colname <- sub("\\()","",as.character(var_name[indices]))
colname <- sub("^t", "time", colname)
colname <- sub("^f", "freq", colname)
colname <- gsub("-", ".", colname)
colname <- sub("BodyBody", "Body", colname)
names(data_set)[3:length(names(data_set))] <- colname

## from the current data set, create a new tidy data set with the average of each variable
## for each activity and each subject, library(dplyr) is reqired (step 5)

library(dplyr)
new_data <- data_set %>% tbl_df() %>%
     group_by(subjectID, activity) %>%
     summarise_all(mean)
new_data <- data.frame(new_data)

## write the new data set to a txt file

write.table(new_data, "data_set.txt", row.name=FALSE)
     