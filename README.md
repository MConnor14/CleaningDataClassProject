ReadMe.txt document for Cleaning Data Class Project
============================================

Written by MConnor
May 24, 2015

The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

We used a subset of the data for this analysis, provided by the class instructors of Getting and Cleaning Data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals was calculated using the Euclidean norm.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Body Acceleration, Body Jerk Acceleration, and Body Gyro along each of the X,Y, and Z axes, and Body Acceleration Jerk Magnitude, Body Gyro Magnitude, Body Gyro Jerk Magnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  '-X', ‘-Y’, ‘Z’ are used to denote 3-axial signals in the X, Y and Z directions. The set of variables that were estimated from these signals are: Mean value and Standard deviation.

The data was divided between training and test.  The first step was to combine all the data into one data set.  After reading in the three training files, the V1 variables in the subject and activity files were changed to SubjectNo and Activity respectively.  Then the three files were combined into one – i.e., the data file now has two more columns specifying the Subject number and Activity for each data recording.  After repeating this for the test dataset, the two datasets were appended so all the data was in one place.

Then a new dataset was created by selecting only the columns related to mean and standard deviation calculations.  This had been represented with mean() and std().

In order for the dataset to be more readable, the activity codes were decoded into words: 
: 1 = WALKING 
: 2 = WALKING_UPSTAIRS 
: 3=WALKING_DOWNSTAIRS  
: 4= SITTING 
: 5= STANDING
: 6=LAYING

The column headers were also updated to better clarify the data in each column.  These headers are listed here:

Mean Body Acceleration - X (time domain)  
Mean Body Acceleration - Y (time domain)  
Mean Body Acceleration - Z (time domain)  
Std Dev Body Acceleration - X (time domain)  
Std Dev Body Acceleration - Y (time domain)  
Std Dev Body Acceleration - Z (time domain)  
Mean Gravity Acceleration - X (time domain)  
Mean Gravity Acceleration - Y (time domain)  
Mean Gravity Acceleration - Z (time domain)  
Std Dev Gravity Acceleration - X (time domain)  
Std Dev Gravity Acceleration - Y (time domain)  
Std Dev Gravity Acceleration - Z (time domain)  
Mean Body Acceleration Jerk  - X (time domain)   
Mean BodyAcceleration Jerk  - Y (time domain)  
Mean Body Acceleration Jerk  - Z (time domain)  
Std Dev Body Jerk Acceleration - X (time domain)  
Std Dev Body Jerk Acceleration - Y (time domain)  
Std Dev Body Jerk Acceleration - Z (time domain)  
Mean Body Gyro  - X (time domain)  
Mean Body Gyro  - Y (time domain)  
Mean Body Gyro  - Z (time domain)  
Std Dev Body Gyro  - X (time domain)  
Std Dev Body Gyro  - Y (time domain)  
Std Dev Body Gyro  - Z (time domain)  
Mean Body Gyro Jerk  - X (time domain)  
Mean Body Gyro Jerk  - Y (time domain)  
Mean Body Gyro Jerk  - Z (time domain)  
Std Dev Body Gyro Jerk  - X (time domain)  
Std Dev Body Gyro Jerk  - Y (time domain)  
Std Dev Body Gyro Jerk  - Z (time domain)  
Mean Body Acceleration Magnitude (time dimension)  
Std Dev Body Acceleration Magnitude (time dimension)  
Mean Body Acceleration Jerk Magnitude (time dimension)  
Std Dev Body Acceleration Jerk Magnitude (time dimension)  
Mean Body Gyro Magnitude (time dimension)  
Std Dev Body Gyro Magnitude (time dimension)  
Mean Body Gyro Jerk Magnitude (time dimension)  
Std Dev Body Gyro Jerk Magnitude (time dimension)  
Mean Body Acceleration - X (frequency domain)  
Mean Body Acceleration - Y (frequency domain)  
Mean Body Acceleration - Z (frequency domain)  
Std Dev Body Acceleration - X (frequency domain)  
Std Dev Body Acceleration - Y (frequency domain)  
Std Dev Body Acceleration - Z (frequency domain)
Mean Body Acceleration Jerk - X (frequency domain)  
Mean Body Acceleration Jerk - Y (frequency domain)  
Mean Body Acceleration Jerk - Z (frequency domain)  
Std Dev Body Acceleration Jerk - X (frequency domain)  
Std Dev Body Acceleration Jerk - Y (frequency domain)  
Std Dev Body Acceleration Jerk - Z (frequency domain)  
Mean Body Gyro - X (frequency domain)  
Mean Body Gyro - Y (frequency domain)  
Mean Body Gyro - Z (frequency domain)  
Std Dev Body Gyro - X (frequency domain)  
Std Dev Body Gyro - Y (frequency domain)  
Std Dev Body Gyro - Z (frequency domain)  
Mean Body Acceleration Magnitude (frequency domain) 
Std Dev Body Acceleration Magnitude (frequency domain)  
Mean Body Body Gyro Magnitude (frequency domain)  
Std Dev Body Body Gyro Magnitude (frequency domain) 
Mean Body Body Gyro Jerk Magnitude (frequency domain)  
Std Dev Body Body Gyro Jerk Magnitude (frequency domain) 

Finally, the average of each data was calculated by activity by subject, and the new tidy dataset was saved.


> Written with [StackEdit](https://stackedit.io/).
