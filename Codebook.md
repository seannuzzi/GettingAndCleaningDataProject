---
title: "Codebook"
author: "Steven Eannuzzi"
date: "July 22, 2017"
output:
  html_document:
    keep_md: yes
---

## Project Description
This project was created for the *Getting and Cleaning Data Course Project*

The goal of this project is to pre-process (tidy) wearable computer day.  This is accomplished with the following steps:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##Study design and data processing
###Collection of the raw data
Raw data was provided as an extract from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Notes on the original (raw) data 
Please take note of the features_info.txt file.  This file nicely details the columns.

##Creating the tidy datafile
###Guide to create the tidy data file
1. With Internet connectivity, simply run the script.
1. Data is downloaded as needed and unzipped into the ```UCI HAR Dataset``` directory.
1. ```./tidy``` will contain tidy data.  Two files will be created.
 1. ```blended.txt``` will effectively have test and training data blended with enriched column names.
 1. ```blendedaverage.txt``` is a summarized version of ```blended.txt``` that averages each measurement per subject.

###Cleaning of the data
*Cleaning* is a generous term for this script.  Basically this script updates column names and creates a smaller subset for standard deviation and means.  A full and summarized (average) blends files are created for further analysis.

##Description of the variables
Notes from the original source:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix > 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


Full blended and summary dataset columns:
```
 $ subject                                                            : int  1 1 1 1 1 1 1 1 1 1 ...
 $ TimeDomain.BodyAcceleration.MeanX                                  : num  0.289 0.278 0.28  ...
 $ TimeDomain.BodyAcceleration.MeanY                                  : num  -0.0203 -0.0164 -0.0195  ...
 $ TimeDomain.BodyAcceleration.MeanZ                                  : num  -0.133 -0.124 -0.113  ...
 $ TimeDomain.BodyAcceleration.StandardDeviationX                     : num  -0.995 -0.998 -0.995 ...
 $ TimeDomain.BodyAcceleration.StandardDeviationY                     : num  -0.983 -0.975 -0.967 ...
 $ TimeDomain.BodyAcceleration.StandardDeviationZ                     : num  -0.914 -0.96 -0.979  ...
 $ TimeDomain.GravityAcceleration.MeanX                               : num  0.963 0.967 0.967  ...
 $ TimeDomain.GravityAcceleration.MeanY                               : num  -0.141 -0.142 -0.142 ...
 $ TimeDomain.GravityAcceleration.MeanZ                               : num  0.1154 0.1094 0.1019 ...
 $ TimeDomain.GravityAcceleration.StandardDeviationX                  : num  -0.985 -0.997 ...
 $ TimeDomain.GravityAcceleration.StandardDeviationY                  : num  -0.982 -0.989 -0.993 ...
 $ TimeDomain.GravityAcceleration.StandardDeviationZ                  : num  -0.878 -0.932 -0.993  ...
 $ TimeDomain.BodyAccelerationJerk.MeanX                              : num  0.078 0.074 0.0736 ...
 $ TimeDomain.BodyAccelerationJerk.MeanY                              : num  0.005 0.00577 0.0031  ...
 $ TimeDomain.BodyAccelerationJerk.MeanZ                              : num  -0.06783 0.02938 -0.00905 ...
 $ TimeDomain.BodyAccelerationJerk.StandardDeviationX                 : num  -0.994 -0.996 -0.991 ...
 $ TimeDomain.BodyAccelerationJerk.StandardDeviationY                 : num  -0.988 -0.981 -0.981 ...
 $ TimeDomain.BodyAccelerationJerk.StandardDeviationZ                 : num  -0.994 -0.992 -0.99  ...
 $ TimeDomain.BodyGyro.MeanX                                          : num  -0.0061 -0.0161 -0.0317  ...
 $ TimeDomain.BodyGyro.MeanY                                          : num  -0.0314 -0.0839 -0.1023 ...
 $ TimeDomain.BodyGyro.MeanZ                                          : num  0.1077 0.1006 0.0961 ...
 $ TimeDomain.BodyGyro.StandardDeviationX                             : num  -0.985 -0.983 -0.976  ...
 $ TimeDomain.BodyGyro.StandardDeviationY                             : num  -0.977 -0.989 -0.994  ...
 $ TimeDomain.BodyGyro.StandardDeviationZ                             : num  -0.992 -0.989 -0.986  ...
 $ TimeDomain.BodyGyroJerk.MeanX                                      : num  -0.0992 -0.1105 -0.1085 ...
 $ TimeDomain.BodyGyroJerk.MeanY                                      : num  -0.0555 -0.0448 -0.0424  ...
 $ TimeDomain.BodyGyroJerk.MeanZ                                      : num  -0.062 -0.0592 -0.0558  ...
 $ TimeDomain.BodyGyroJerk.StandardDeviationX                         : num  -0.992 -0.99 -0.988  ...
 $ TimeDomain.BodyGyroJerk.StandardDeviationY                         : num  -0.993 -0.997 -0.996  ...
 $ TimeDomain.BodyGyroJerk.StandardDeviationZ                         : num  -0.992 -0.994 -0.992  ...
 $ TimeDomain.BodyAccelerationMagnitude.Mean                          : num  -0.959 -0.979 -0.984 ...
 $ TimeDomain.BodyAccelerationMagnitude.StandardDeviation             : num  -0.951 -0.976 -0.988 ...
 $ TimeDomain.GravityAccelerationMagnitude.Mean                       : num  -0.959 -0.979 -0.984  ...
 $ TimeDomain.GravityAccelerationMagnitude.StandardDeviation          : num  -0.951 -0.976 -0.988  ...
 $ TimeDomain.BodyAccelerationJerkMagnitude.Mean                      : num  -0.993 -0.991 -0.989  ...
 $ TimeDomain.BodyAccelerationJerkMagnitude.StandardDeviation         : num  -0.994 -0.992 -0.99  ...
 $ TimeDomain.BodyGyroMagnitude.Mean                                  : num  -0.969 -0.981 -0.976  ...
 $ TimeDomain.BodyGyroMagnitude.StandardDeviation                     : num  -0.964 -0.984 -0.986  ...
 $ TimeDomain.BodyGyroJerkMagnitude.Mean                              : num  -0.994 -0.995 -0.993  ...
 $ TimeDomain.BodyGyroJerkMagnitude.StandardDeviation                 : num  -0.991 -0.996 -0.995  ...
 $ FrequencyDomain.BodyAcceleration.MeanX                             : num  -0.995 -0.997 -0.994  ...
 $ FrequencyDomain.BodyAcceleration.MeanY                             : num  -0.983 -0.977 -0.973 ...
 $ FrequencyDomain.BodyAcceleration.MeanZ                             : num  -0.939 -0.974 -0.983  ...
 $ FrequencyDomain.BodyAcceleration.StandardDeviationX                : num  -0.995 -0.999 -0.996 ...
 $ FrequencyDomain.BodyAcceleration.StandardDeviationY                : num  -0.983 -0.975 -0.966  ...
 $ FrequencyDomain.BodyAcceleration.StandardDeviationZ                : num  -0.906 -0.955 -0.977  ...
 $ FrequencyDomain.BodyAccelerationJerk.MeanX                         : num  -0.992 -0.995 -0.991  ...
 $ FrequencyDomain.BodyAccelerationJerk.MeanY                         : num  -0.987 -0.981 -0.982  ...
 $ FrequencyDomain.BodyAccelerationJerk.MeanZ                         : num  -0.99 -0.99 -0.988  ...
 $ FrequencyDomain.BodyAccelerationJerk.StandardDeviationX            : num  -0.996 -0.997 -0.991  ...
 $ FrequencyDomain.BodyAccelerationJerk.StandardDeviationY            : num  -0.991 -0.982 -0.981  ...
 $ FrequencyDomain.BodyAccelerationJerk.StandardDeviationZ            : num  -0.997 -0.993 -0.99  ...
 $ FrequencyDomain.BodyGyro.MeanX                                     : num  -0.987 -0.977 -0.975  ...
 $ FrequencyDomain.BodyGyro.MeanY                                     : num  -0.982 -0.993 -0.994  ...
 $ FrequencyDomain.BodyGyro.MeanZ                                     : num  -0.99 -0.99 -0.987  ...
 $ FrequencyDomain.BodyGyro.StandardDeviationX                        : num  -0.985 -0.985 -0.977  ...
 $ FrequencyDomain.BodyGyro.StandardDeviationY                        : num  -0.974 -0.987 -0.993  ...
 $ FrequencyDomain.BodyGyro.StandardDeviationZ                        : num  -0.994 -0.99 -0.987  ...
 $ FrequencyDomain.BodyAccelerationMagnitude.Mean                     : num  -0.952 -0.981 -0.988  ...
 $ FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation        : num  -0.956 -0.976 -0.989  ...
 $ FrequencyDomain.BodyBodyAccelerationJerkMagnitude.Mean             : num  -0.994 -0.99 -0.989  ...
 $ FrequencyDomain.BodyBodyAccelerationJerkMagnitude.StandardDeviation: num  -0.994 -0.992 -0.991  ...
 $ FrequencyDomain.BodyBodyGyroMagnitude.Mean                         : num  -0.98 -0.988 -0.989  ...
 $ FrequencyDomain.BodyBodyGyroMagnitude.StandardDeviation            : num  -0.961 -0.983 -0.986  ...
 $ FrequencyDomain.BodyBodyGyroJerkMagnitude.Mean                     : num  -0.992 -0.996 -0.995  ...
 $ FrequencyDomain.BodyBodyGyroJerkMagnitude.StandardDeviation        : num  -0.991 -0.996 -0.995  ...
 $ activity                                                           : chr  "standing" "standing"  ...
```

Note that there was no special processing on column values except for averaging in the summary extract.

##Sources
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


