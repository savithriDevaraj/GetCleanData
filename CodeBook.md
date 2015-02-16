#Human Activity Recognition Using Smart phones.
#Code Book. 
#Created by Savithri Devaraj, 
#Date 02/16/2015

This document describes the transformations to the UCI HAR dataset to get it ready for statistical analysis.

##Reading and pre-processing
All the datasets are ready into the home directory R/GetCleanData.
Files with "subject_* in their file names contains the subject ID. 
Files with "x_" in their file names contains the values for the features/variables of dataset
Files with "y_" in their file names contains the activities for which the values were measured

##Data Transformation
The following steps are used to generate the combined (Train and Test) dataset with valid R variable names

* Read in the Features of the data set in "dFeatures" 
* Clean variable names to be legal R variables,i.e, remove the "-" and "()" from the variable names in "dFeatures" 
* Read the activity labels file that contains the activity ID and the activity name mapping in "dActivities" 
* Combine the train and test datasets to build the complete dataset in "dataX", "dataY", "dataSubj"
* Add activity label to the activities dataset, dActivities. 
* Combine the Subject/activity datasets in "dataSubActivity"
* Label the measured variables from the cleaned "dFeatures"  
* Choose only the required columns to build the clean dataset in "matches"
* Extract "matches" columns from dataX into "limited" dataset
* Combine "dataSubActivity" (3 columns) and "limited" (79 columns) to "dData"
* Remove "activity ID" from "dData" to generate "cleanData"
* Return "cleanData"

## "cleanData" Description
"cleanData contains human activity recognition data measured for 30 subjects. It contains 10299 rows of data and 81 columns. The first column, subject, is the experimental subject, the 2nd column shows the activity, viz., walking, walking upstairs, sitting, etc. The next 79 columns are the scrubbed data measurements from the accelerometer of the Samsung Galaxy S smart phone. 


###Variables

subject		-		Experimental subject, ranging from 1 to 30
activity	-		Activities, values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, STANDING, SITTING, LAYING)

In the following 79 variables, '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 't' denotes time domain signals, captured at 50 Hz. 'f' denote frequency domain signals. "mean" indicates mean values, and "std".  indicates standard deviation from the mean.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

tBodyAccmeanX,		tBodyAccmeanY,		tBodyAccmeanZ,	
tBodyAccstdX,		tBodyAccstdY,		tBodyAccstdZ,
tGravityAccmeanX,	tGravityAccmeanY,	tGravityAccmeanZ,	
tGravityAccstdX,	tGravityAccstdY,	tGravityAccstdZ,	
tBodyAccJerkmeanX,	tBodyAccJerkmeanY,	tBodyAccJerkmeanZ,	
tBodyAccJerkstdX,	tBodyAccJerkstdY,	tBodyAccJerkstdZ,	
tBodyGyromeanX,		tBodyGyromeanY,		tBodyGyromeanZ,	
tBodyGyrostdX,		tBodyGyrostdY,		tBodyGyrostdZ,	
tBodyGyroJerkmeanX,	tBodyGyroJerkmeanY,	tBodyGyroJerkmeanZ,
tBodyGyroJerkstdX,	tBodyGyroJerkstdY,	tBodyGyroJerkstdZ,
tBodyAccMagmean,	tBodyAccMagstd,	
tGravityAccMagmean,	tGravityAccMagstd,	
tBodyAccJerkMagmean,tBodyAccJerkMagstd,	
tBodyGyroMagmean	tBodyGyroMagstd,	
tBodyGyroJerkMagmean,	tBodyGyroJerkMagstd,	
fBodyAccmeanX,		fBodyAccmeanY,		fBodyAccmeanZ,	
fBodyAccstdX,		fBodyAccstdY,		fBodyAccstdZ,	
fBodyAccmeanFreqX,	fBodyAccmeanFreqY,	fBodyAccmeanFreqZ,	
fBodyAccJerkmeanX,	fBodyAccJerkmeanY,	fBodyAccJerkmeanZ,	
fBodyAccJerkstdX,	fBodyAccJerkstdY,	fBodyAccJerkstdZ,	
fBodyAccJerkmeanFreqX,	fBodyAccJerkmeanFreqY,	fBodyAccJerkmeanFreqZ,	
fBodyGyromeanX, 		fBodyGyromeanY,		fBodyGyromeanZ,	
fBodyGyrostdX,		fBodyGyrostdY,		fBodyGyrostdZ,	
fBodyGyromeanFreqX,	fBodyGyromeanFreqY,	fBodyGyromeanFreqZ,	
fBodyAccMagmean,		fBodyAccMagstd,		fBodyAccMagmeanFreq,	
fBodyBodyAccJerkMagmean,	fBodyBodyAccJerkMagstd,	fBodyBodyAccJerkMagmeanFreq,	
fBodyBodyGyroMagmean,	fBodyBodyGyroMagstd,	fBodyBodyGyroMagmeanFreq,	
fBodyBodyGyroJerkMagmean, fBodyBodyGyroJerkMagstd,	fBodyBodyGyroJerkMagmeanFreq


