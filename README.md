# GettingAndCleaningData
Peer-graded Assignment: Getting and Cleaning Data Course Project

* [Problem Summary](#summary)
* [Repository Contents](#contents)

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
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each      subject.

**data_set.txt**: The data set created by running run_analysis.R script (step 5). It contains the average value of each variable (with only the measurements on the mean and standard deviation) for each activity and each subject. 

**CodeBook.md**: describes the variables and the data in "data_set.txt", and any transformations or work performed to clean up the original data.  



