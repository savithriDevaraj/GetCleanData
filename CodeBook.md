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
Read in the Features of the data set in "dFeatures" 
Read the activity labels file that contains the activity ID and the activity name mapping in "dActivities" 

##Data Transformation
The following steps are used to generate the combined (Train and Test) dataset with valid R variable names


* Cleaned variable names to be legal R variables,i.e, remove the "-" and "()" from the variable names in "dFeatures". Replaced "BodyBody" by "Body" in some frequency domain variables.
* Combined the train and test datasets to build the complete dataset in "dataX", "dataY", "dataSubj"
* Added activity label to the activities dataset, dActivities. 
* Combined the Subject/activity datasets in "dataSubActivity"
* Labelled the measured variables from the cleaned "dFeatures"  
* Chose only the required columns to build the clean dataset in "matches"
* Extracted "matches" columns from dataX into "limited" dataset
* Combined "dataSubActivity" (3 columns) and "limited" (79 columns) to "dData"
* Removed "activity ID" from "dData" to generate "cleanData"
* This cleaned data has 1 variable/measure in each column, and each row is an independent observation for subject/activity. There are multiple observations for subject/activity in this dataset.
* Summarized (group) subject/activity observations and calculated mean of these observations to generate 1 averaged observation for each subject/activity combination in tidyData. This reduces 10299 observations to 180 (30 times 6).
* Ordered the tidyData dataset by subject.
* Returned this "OrderedTidyData"

## "orderedTidyData" Description
This data contains human activity recognition data measured for 30 subjects. It contains 180 rows of data and 81 columns. The first column, subject, is the experimental subject, the 2nd column shows the activity, viz., walking, walking upstairs, sitting, etc. The next 79 columns are the averaged data measurements from the accelerometer of the Samsung Galaxy S smart phone. 


###Variables

subject		-		Experimental subject, ranging from 1 to 30
activity	-		Activities, values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, STANDING, SITTING, LAYING)

In the following 79 variables, '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 
"mean" indicates mean values, and "std" indicates standard deviation from the mean.
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 

The following 't' variables denotes time domain signals, captured at 50 Hz. 

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
tBodyGyroJerkMagmean,	tBodyGyroJerkMagstd.

The following 'f' variables denote frequency domain signals -
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
fBodyAccJerkMagmean,	fBodyAccJerkMagstd,	fBodyAccJerkMagmeanFreq,	
fBodyGyroMagmean,	fBodyGyroMagstd,	fBodyGyroMagmeanFreq,	
fBodyGyroJerkMagmean, fBodyGyroJerkMagstd,	fBodyGyroJerkMagmeanFreq


