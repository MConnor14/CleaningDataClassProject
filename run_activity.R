library(dplyr)

## Read input files into R
## Read in the training sets

setwd("./train")

traindata <- read.table("X_train.txt")
trainactivity <- read.table("y_train.txt")
trainsubject <- read.table("subject_train.txt")

## Rename V1 in activity dataset
trainactivity <- rename(trainactivity, Activity = V1)

## Rename V1 in subject datasest
trainsubject <- rename(trainsubject, SubjectNo = V1)

##Combine all three datasets into a new dataset called trainset
trainset <- cbind(trainactivity, trainsubject, traindata)

##Repeat for the test files
setwd("..")
setwd("./test")

testdata <- read.table("X_test.txt")
testactivity <- read.table("y_test.txt")
testsubject <- read.table("subject_test.txt")

## Rename V1 in activity dataset
testactivity <- rename(testactivity, Activity = V1)

## Rename V1 in subject datasest
testsubject <- rename(testsubject, SubjectNo = V1)

##Step 1. Combine all three datasets into a new dataset called trainset
testset <- cbind(testactivity, testsubject, testdata)

##Append test dataset to training data set
Alldata <- rbind(trainset, testset)

## Step 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

MeanStdVars <- Alldata[c(1:8,43:48,83:88,123:128,163:168,203:204,229:230,242:243,255:256,268:273,
                         + 347:352,426:431,505:506,531:532,544:545)]

## Step 3.Uses descriptive activity names to name the activities in the data set
MeanStdVars$Activity <- factor(MeanStdVars$Activity, levels = c(1,2,3,4,5,6), labels = c("WALKING",
     "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## Step 4.Appropriately label the data set with descriptive variable names
MeanStdVars <- rename(MeanStdVars,
                      "Mean Body Acceleration - X (time domain)" = V1,
                      "Mean Body Acceleration - Y (time domain)" = V2,
                      "Mean Body Acceleration - Z (time domain)" = V3,
                      "Std Dev Body Acceleration - X (time domain)" = V4,
                      "Std Dev Body Acceleration - Y (time domain)" = V5,
                      "Std Dev Body Acceleration - Z (time domain)" = V6,
                      "Mean Gravity Acceleration - X (time domain)" = V41,
                      "Mean Gravity Acceleration - Y (time domain)" = V42,
                      "Mean Gravity Acceleration - Z (time domain)" = V43,
                      "Std Dev Gravity Acceleration - X (time domain)" = V44,
                      "Std Dev Gravity Acceleration - Y (time domain)" = V45,
                      "Std Dev Gravity Acceleration - Z (time domain)" = V46,
                      "Mean Body Acceleration Jerk  - X (time domain)" = V81,
                      "Mean BodyAcceleration Jerk  - Y (time domain)" = V82,
                      "Mean Body Acceleration Jerk  - Z (time domain)" = V83,
                      "Std Dev Body Jerk Acceleration - X (time domain)" = V84,
                      "Std Dev Body Jerk Acceleration - Y (time domain)" = V85,
                      "Std Dev Body Jerk Acceleration - Z (time domain)" = V86,
                      "Mean Body Gyro  - X (time domain)" = V121,
                      "Mean Body Gyro  - Y (time domain)" = V122,
                      "Mean Body Gyro  - Z (time domain)" = V123,
                      "Std Dev Body Gyro  - X (time domain)" = V124,
                      "Std Dev Body Gyro  - Y (time domain)" = V125,
                      "Std Dev Body Gyro  - Z (time domain)" = V126,
                      "Mean Body Gyro Jerk  - X (time domain)" = V161,
                      "Mean Body Gyro Jerk  - Y (time domain)" = V162,
                      "Mean Body Gyro Jerk  - Z (time domain)" = V163,
                      "Std Dev Body Gyro Jerk  - X (time domain)" = V164,
                      "Std Dev Body Gyro Jerk  - Y (time domain)" = V165,
                      "Std Dev Body Gyro Jerk  - Z (time domain)" = V166,
                      "Mean Body Acceleration Magnitude (time dimension)" = V201,
                      "Std Dev Body Acceleration Magnitude (time dimension)" = V202,
                      "Mean Body Acceleration Jerk Magnitude (time dimension)" = V227,
                      "Std Dev Body Acceleration Jerk Magnitude (time dimension)" = V228,
                      "Mean Body Gyro Magnitude (time dimension)" = V240,
                      "Std Dev Body Gyro Magnitude (time dimension)" = V241,
                      "Mean Body Gyro Jerk Magnitude (time dimension)" = V253,
                      "Std Dev Body Gyro Jerk Magnitude (time dimension)" = V254,
                      "Mean Body Acceleration - X (frequency domain)" = V266,
                      "Mean Body Acceleration - Y (frequency domain)" = V267,
                      "Mean Body Acceleration - Z (frequency domain)" = V268,
                      "Std Dev Body Acceleration - X (frequency domain)" = V269,
                      "Std Dev Body Acceleration - Y (frequency domain)" = V270,
                      "Std Dev Body Acceleration - Z (frequency domain)" = V271,
                      "Mean Body Acceleration Jerk - X (frequency domain)" = V345,
                      "Mean Body Acceleration Jerk - Y (frequency domain)" = V346,
                      "Mean Body Acceleration Jerk - Z (frequency domain)" = V347,
                      "Std Dev Body Acceleration Jerk - X (frequency domain)" = V348,
                      "Std Dev Body Acceleration Jerk - Y (frequency domain)" = V349,
                      "Std Dev Body Acceleration Jerk - Z (frequency domain)" = V350,
                      "Mean Body Gyro - X (frequency domain)" = V424,
                      "Mean Body Gyro - Y (frequency domain)" = V425,
                      "Mean Body Gyro - Z (frequency domain)" = V426,
                      "Std Dev Body Gyro - X (frequency domain)" = V427,
                      "Std Dev Body Gyro - Y (frequency domain)" = V428,
                      "Std Dev Body Gyro - Z (frequency domain)" = V429,
                      "Mean Body Acceleration Magnitude (frequency domain)" = V503,
                      "Std Dev Body Acceleration Magnitude (frequency domain)" = V504,
                      "Mean Body Body Gyro Magnitude (frequency domain)" = V529,
                      "Std Dev Body Body Gyro Magnitude (frequency domain)" = V530,
                      "Mean Body Body Gyro Jerk Magnitude (frequency domain)" = V542,
                      "Std Dev Body Body Gyro Jerk Magnitude (frequency domain)" = V543)

##Step 5 From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject 

Clean_Tidy <- group_by(MeanStdVars, Activity, SubjectNo) %>% summarise_each(funs(mean))

## Save as text file for uploading
write.table(Clean_Tidy, "./Clean_Tidy.txt", row.name = FALSE)


                      
                      
