The first column in "data_set.txt" is **subjectID** which contains integer variables from 1 to 30, indicate the identifier number of subject, who carried out the experiment. The second column is **activity** contains 6 factor variables, provide descriptive names for the activities performed by each subject: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS". Other 66 columns in the data set contain numeric variables of average value for different types of measurement in the expirement. 

The data collected for measurements come from the accelerometer and gyroscope 3-axial raw signals timeAcc.XYZ and timeGyro.XYZ. These time domain signals () were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc.XYZ and timeGravityAcc.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk.XYZ and timeBodyGyroJerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

For each kind of signals, *mean* variable and *standard deviation* variable were estimated, denoted by 'mean' and 'std'. 

The list of variables are shown below with '.XYZ' is used to denote 3-axial signals in the X, Y and Z directions:

**timeBodyAcc.mean.XYZ  
timeBodyAcc.std.XYZ  
timeGravityAcc.mean.XYZ__
timeGravityAcc.std.XYZ__
timeBodyAccJerk.mean.XYZ__
timeBodyAccJerk.std.XYZ__
timeBodyGyro.mean.XYZ__
timeBodyGyro.std.XYZ__
timeBodyGyroJerk.mean.XYZ__
timeBodyGyroJerk.std.XYZ__
timeBodyAccMag.mean__
timeBodyAccMag.std__
timeGravityAccMag.mean__
timeGravityAccMag.std__
timeBodyAccJerkMag.mean__
timeBodyAccJerkMag.std__
timeBodyGyroMag.mean__
timeBodyGyroMag.std__
timeBodyGyroJerkMag.mean__
timeBodyGyroJerkMag.std__
freqBodyAcc.mean.XYZ__
freqBodyAcc.std.XYZ__
freqBodyAccJerk.mean.XYZ__
freqBodyAccJerk.std.XYZ__
freqBodyGyro.mean.XYZ__
freqBodyGyro.std.XYZ__
freqBodyAccMag.mean__
freqBodyAccMag.std__
freqBodyAccJerkMag.mean__
freqBodyAccJerkMag.std__
freqBodyGyroMag.mean__
freqBodyGyroMag.std__
freqBodyGyroJerkMag.mean__
freqBodyGyroJerkMag.std**
