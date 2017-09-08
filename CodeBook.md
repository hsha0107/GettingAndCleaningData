The first column in "data_set.txt" is **subjectID** which contains integer variables from 1 to 30, indicate the identifier number of subject, who carried out the experiment. The second column is **activity** contains 6 factor variables, provide descriptive names for the activities performed by each subject: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS". Other 66 columns in the data set contain numeric variables of average value for different types of measurement in the expirement. 

The data collected for measurements come from the accelerometer and gyroscope 3-axial raw signals timeAcc.XYZ and timeGyro.XYZ. These time domain signals (denoted by 'time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc.XYZ and timeGravityAcc.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk.XYZ and timeBodyGyroJerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

For each kind of signals, *mean* variable and *standard deviation* variable were estimated, denoted by 'mean' and 'std'. 

The list of variables are shown below with '.XYZ' is used to denote 3-axial signals in the X, Y and Z directions:

**timeBodyAcc.mean.XYZ  
timeBodyAcc.std.XYZ  
timeGravityAcc.mean.XYZ  
timeGravityAcc.std.XYZ  
timeBodyAccJerk.mean.XYZ  
timeBodyAccJerk.std.XYZ  
timeBodyGyro.mean.XYZ  
timeBodyGyro.std.XYZ  
timeBodyGyroJerk.mean.XYZ  
timeBodyGyroJerk.std.XYZ  
timeBodyAccMag.mean  
timeBodyAccMag.std  
timeGravityAccMag.mean  
timeGravityAccMag.std  
timeBodyAccJerkMag.mean  
timeBodyAccJerkMag.std  
timeBodyGyroMag.mean  
timeBodyGyroMag.std  
timeBodyGyroJerkMag.mean  
timeBodyGyroJerkMag.std  
freqBodyAcc.mean.XYZ  
freqBodyAcc.std.XYZ  
freqBodyAccJerk.mean.XYZ  
freqBodyAccJerk.std.XYZ  
freqBodyGyro.mean.XYZ  
freqBodyGyro.std.XYZ  
freqBodyAccMag.mean  
freqBodyAccMag.std  
freqBodyAccJerkMag.mean  
freqBodyAccJerkMag.std  
freqBodyGyroMag.mean  
freqBodyGyroMag.std  
freqBodyGyroJerkMag.mean  
freqBodyGyroJerkMag.std**
