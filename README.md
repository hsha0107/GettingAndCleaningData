# GettingAndCleaningData
Peer-graded Assignment: Getting and Cleaning Data Course Project

* [Problem Summary](#summary)
* [Repository Contents](#contents)
* [R Script Process](#process)

<h1 id=summary>Problem Summary </h1>

In the assignment Getting and Cleaning on Coursera, Johns Hopkins University, a set of data collected from the accelerometers from the Samsung Galaxy S smartphone is provided. The data set includes a test set and train set for a group of 30 people within age of 19-48 years. Each person wore a Samsung Glaxy S II smartphone and performed 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Using embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity are captured at a constant rate of 50Hz. Data is downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The purpose of this project is to creat a new tidy data from the original Samsung data set, that can be used for later analysis. The new data set contains the average value of each variable (with only the measurements on the mean and standard deviation) for each activity and each subject. 

<h1 id=contents>Repository Contents</h1>

**README.md**: Documentation explaining the project and how to use files contained in the repository. 

**run_analysis.R**: the R script performs the following steps
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and        each subject.

**data_set.txt**: The data set created by running run_analysis.R script (step 5). It contains the average value of each variable (with only the measurements on the mean and standard deviation) for each activity and each subject. 

**CodeBook.md**: describes the variables and the data in "data_set.txt", and any transformations or work performed to clean up the original data.  

<h1 id=process>R Script Process </h1>

For convenient, all the following files of the Samsung dat set are stored in the working directory: "X_test.txt", "X_train.txt", "features.txt", "y_test.txt", "y_train.txt", "activity_labels.txt", "subject_test.txt", "subject_train.txt"

Firstly, using <code>read.table()</code> to read the measurement data from "X_test.txt" and "X_train.txt". Then using <code>rbind()</code> to merge the 2 sets into 1 data set. (step 1)

Secondly, using <code>read.table()</code> to read the variable names from "features.txt", it is stored in a vector. Since only measurements on the mean and standard deviation are needed, only variable names contain *mean()* or *std()* are considered. Noted that, there are variable names contain *meanFreq()* indicate weighted average of the frequency components. For simplicity, it is not taken into account here. The required indices can be extracted using <code>grep(("mean\\()|std\\()"), var_name)</code>. Updating the data set with only extracted indices: <code>data_set <- data_set[, indices]</code>. (step 2)

Thirdly, read data from "activity_labels.txt" and store it in a vector. The vector contains 6 characters that give descriptive activity names: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING". In addition, read and combine (<code>rbind()</code>) data from "y_test.txt" and "y_train.txt" to get a vector of activity label number (from 1 to 6) for each observation. Next, convert the activity label numbers to corresponding activivty names, using the code: <code>for(i in activity_label){activity <- append(activity, label_name[i])}</code>. A column with descriptive activity names is created and is added to the data set later. 

Another column indicate the subject performs the activity should also be included in the data set. To do that, read and combine data from "subject_test.txt" and "subject_train.txt". Then use <code>cbind()</code> to combine the subject ID, activity name with the current data set. (step 3)

The descriptive variable names are stored in the vector var_name. Some modifications are made with <code>sub()</code> and <code>gsub()</code> to make it more descriptive and follow with standard rule for variable names: remove *'()'*, replace *'-'* with *'.'*, replace initial *'t'* letter with *'time'*, and replace initial *'f'* letter with *'freq'*. Then, change the names of the variables <code>names(data_set)[3:length(names(data_set))] <- colname</code>. (step 4)






