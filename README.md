# Getting And Cleaning Data
Peer-graded Assignment: Getting and Cleaning Data Course Project

* [Problem Summary](#summary)
* [Repository Contents](#contents)
* [R Script Process](#process)
* [Tidy Data Set](#dataset)

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

The descriptive variable names are stored in the vector var_name. Some modifications are made with <code>sub()</code> and <code>gsub()</code> to make it more descriptive and follow with standard rule for variable names: remove *'()'*, replace *'-'* with *'.'*, replace initial *'t'* letter with *'time'*, and replace initial *'f'* letter with *'freq'*. Then, change the column names of the data set with new created variable names (colname) <code>names(data_set)[3:length(names(data_set))] <- colname</code>. (step 4)

In last step, load the <code>library(dplyr)</code> and apply <code>group_by</code> function. The code below will creat a new independent tidy data set with the average of each variable for each activity and each subject in current data set. (step 5)

<code>new_data <- data_set %>% tbl_df() %>%
     group_by(subjectID, activity) %>%
     summarise_all(mean)</code>
     
 Finally, write new data set into a txt file created with <code>write.table()</code> and <code>row.name=FALSE</code>
 
<h1 id=dataset>Tidy Data Set </h1> 

The new data set created from the *run_analysis.R* script contains average values of mean or standard deviation measurement variable for each activity and subject pair. There are 30 subjects and 6 activities, so in total, there will be 180 observations for each variable. This data set also contains 68 columns including a column for subject, a column for activity and 66 other columns for the measurement variables. 

Requirements of a tidy data set is 

  1. Each variable forms a column
  2. Each observation forms a row
  3. Each table stores data about one kind of observations
  
This data set is a tidy data set because it fulfill these requirements. Each column in the data set represent only 1 variable, which can be the subject ID or activity performed or 1 of the 66 measurement variables. Each row is for 1 observation. The data set has a total of 180 observations and each observation is corresponding with each activity-subject pair among 30 subjects and 6 activities. The data set has only 1 kind of observational unit which is the subject performed the experiment. 

