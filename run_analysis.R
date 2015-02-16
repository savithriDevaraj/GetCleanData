install.packages("data.table")
library(data.table)
setwd("C:/Users/Anna/Documents/R/GetCleanData")
 
#Step 1 - Read the training and test datasets. Read the variables/features in the dataset

#Read in the Training datasets. 
# _subj contains the subject ID. 
# _X contains the values for the features/variables of dataset
# _Y contains the activities for which the values were measured
dTrainSubj <- data.table(read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors=FALSE))
dTrainX <- data.table(read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE))
dTrainY <- dt_X <- data.table(read.table("UCI HAR Dataset/train/Y_train.txt", stringsAsFactors=FALSE))

#Read in the Test datasets
dTestSubj <- data.table(read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors=FALSE))
dTestX <- data.table(read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE))
dTestY <- dt_X <- data.table(read.table("UCI HAR Dataset/test/Y_test.txt", stringsAsFactors=FALSE))

# Read in the Features of the data set
dFeatures <- data.table(read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE))

# Clean variable/feature names to be legal R variables
dFeatures[, V2:=(gsub("(-|\\(|\\))|,","",V2))]

#Read the acivity_labels file that contains the activity ID and the activity Name mapping
dActivities <- data.table(read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE))

#Combine the train and test datasets to build the complete dataset
dataX <- rbind(dTestX, dTrainX)
dataY <-rbind(dTestY, dTrainY)
dataSubj <-rbind(dTestSubj, dTrainSubj)

# _Y contains the activity IDs for the subject measurements. Using the dactivities' activity label column, set a new column "activity" in _Y
dataY$activity <-"not set"
#dataY$activity[dataY$V1 =="1"] <- "WALKING"
dataY$activity[dataY$V1 =="1"] <- as.character(dActivities[(V1=="1"),V2])
dataY$activity[dataY$V1 =="2"] <- as.character(dActivities[(V1=="2"),V2])
dataY$activity[dataY$V1 =="3"] <- as.character(dActivities[(V1=="3"),V2])
dataY$activity[dataY$V1 =="4"] <- as.character(dActivities[(V1=="4"),V2])
dataY$activity[dataY$V1 =="5"] <- as.character(dActivities[(V1=="5"),V2])
dataY$activity[dataY$V1 =="6"] <- as.character(dActivities[(V1=="6"),V2])


#Column bind Subject and activity into another data table
dataSubActivity <- cbind(dataSubj, dataY)

##Name the columns in data_subj_activity as "subject","activityID" and "activity" in that order
colnames(dataSubActivity) <- c("subject", "activityID","activity")

#Name all variables in data_X using 2nd column in dfeatures
colnames(dataX) <- as.character(dFeatures[,V2])


#Select column names that have "std" or "mean" in the variables/features 
matches <- dataX[,grep("(mean|std)", dFeatures$V2)]

#Extract only those "std" or "mean" columns to a "limited" dataset
limited <- dataX[,matches,with=FALSE] 

#Combine data Tables - for subject/activity and the measurements
dData <- cbind(dataSubActivity, limited)

#Remove activityID column from data - Use activity label instead of activity ID makes it more understandable
cleanData <- dData[,activityID:=NULL]

# Step 4 is OVER! cleandata is the prepared data

# Step 5  
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Count number of groups by subject,activity
#DT[,.N,by=V1]. This gives correct number = 180

cleanData[, .N, by=.(subject,activity)]

#DT[,.SD[c(1,.N)], by=V2]
#cleandata[, .SD[3:.N], by=.(subject,activity)]

#DT[, lapply(.SD, sum), by=V2]
#tidydata <- cleandata[, lapply(.SD[3:.N], mean), by=.(subject,activity)]
tidyData <- cleanData[, lapply(.SD[3:.N], mean), by=.(subject,activity)]

# Order the data by subjects, so it is ready for analysis on subjects
orderedTidyData <- tidyData[order(tidyData$subject),]
 
#write.table() using row.name=FALSE
write.table(orderedTidyData, "GetCleanDataFile", row.names=FALSE, col.names=TRUE, sep="\t",quote=FALSE)

# Change the variable names to indicate they are the mean. Stuck here. Test how to set colnames.
#colnames(tidydata)
#I've using indexing. Basically using your activity column (the one with numbers) as indices to the #activity_labels.txt table and fetch the second column from that, and assign it back into your data.frame/data.table.
#The simplistic way is to have six lines of subset (one line for each number) and use the subset to select the area of #an activityname variable to give a descriptive name. The most elegant is to turn the activity column into a factor, #then change the levels of the factor to text. If you have stuck all the data together it is also safe to use the week #three merge command.

