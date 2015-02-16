## Human Activity Recognition Using Smart phones
## Introduction

This assignment requires us to write R code to read data from the project website, merge the train and test
datasets along with the subjects and activities datasets, assign the variable names and activity names
and produce a clean data set. 
The data to be downloaded is here -
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Download data to a folder where the run_analysis.R will be downloaded to. This is the home folder. Extract the zip files into the same folder, so train and test folders will be underneath this folder.

### Design of the Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smart phone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Data attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Procedure to clean data.
Run the run_analysis.R script to merge and clean the extracted data in the home folder. The script does the following -

* Step 1 - Read training and test Subjects (subject_) and activities (y_) datasets. Read the measured variables(x_) dataset. Read the activity_labels and measured variable names (features). 
* Step 2 - Combined the Subject/activity datasets. Labels the measured variables and the activities.
* Step 3 - Chooses the required "mean" and "std" variables (from x_) for clean dataset. Merges this with the Subject/activity data from Step 2 above
* Step 4 - Returns the cleaned data from Step 3 above for analysis


<!-- -->