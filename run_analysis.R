
#Begin with reading the names of the various activities and features
activityNames <- read.table("./activity_labels.txt") #Total of 6 activities
featureNames <- read.table("./features.txt") #Total of 561 features

#Then read all the files from the folder "train"
trainData <- read.table("./train/X_train.txt")
trainSubjects <- read.table ("./train/subject_train.txt")
trainActivities <- read.table("./train/y_train.txt")

#Clean up all the files and organize them systematically
#in a new table, "trainFinal"
colnames(activityNames) = c("activityID", "Activity") #Give column names to the activity labels file table
colnames(trainData) = featureNames[,2] #Give column names to the train data file
colnames(trainSubjects) = c("subjectID") 
colnames(trainActivities) = c("activityID")
trainFinal <- cbind(trainData, trainSubjects, trainActivities) #Our final train dataset
#is made by combining the data with the the Subject IDs and their corresponding activities.

#Read all the files from the folder "test"
testData <- read.table("./test/X_test.txt")
testSubjects <- read.table("./test/subject_test.txt")
testActivities <- read.table("./test/y_test.txt")

#And repeat the clean-up and organization process to create "testFinal"
colnames(testData) = featureNames[,2] #Give column names to the train data file
colnames(testSubjects) = c("subjectID") 
colnames(testActivities) = c("activityID")
testFinal <- cbind(testData, testSubjects, testActivities)

#Combine the two tables to create the final data table, finalData
finalData <- rbind(trainFinal, testFinal)
finalActivity <- rbind(trainActivities, testActivities)
finalSubjects <- rbind(testSubjects, trainSubjects)

#Extract the measurements on the mean and standard deviation for each measurement
meanAppearances <- grep("mean", featureNames[,2]) #Stores the location of the rows wherever 'mean' appears
stdAppearances <- grep("std", featureNames[,2]) #Stores the location of the rows wherever 'std' appears
meanstdAppearances <- c(meanAppearances, stdAppearances) #Locations of mean and std appearances
meanstdMeasurements <- finalData[meanstdAppearances] #Subset of finalData including only variables with 'mean' and 'std' in the name

#Use descriptive activity names to name the activities in the data set
meanstdMeasurements <- cbind(finalActivity, meanstdMeasurements) #Adds the activityID column to the mean and std measurements subset.
meanstdMeasurements <- merge(meanstdMeasurements, activityNames, by = "activityID", all.x = TRUE) #Merges the activityNames table with our table
col_idx <- grep("Activity", names(meanstdMeasurements))
meanstdMeasurements <- meanstdMeasurements[, c(col_idx, (1:ncol(meanstdMeasurements))[-col_idx])] #Moves the activity column to the front.
meanstdMeasurements <- cbind(meanstdMeasurements, finalSubjects)
col_idx <- grep("subjectID", names(meanstdMeasurements))
meanstdMeasurements <- meanstdMeasurements[, c(col_idx, (1:ncol(meanstdMeasurements))[-col_idx])]

#Remove special characters to increase readability
names(meanstdMeasurements) <- gsub("\\(\\)","",names(meanstdMeasurements)) 
names(meanstdMeasurements) <- gsub("-","",names(meanstdMeasurements)) 

#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
secondData <- aggregate(meanstdMeasurements[,4:81],list(Activity = meanstdMeasurements$Activity, subjectID=meanstdMeasurements$subjectID),mean, na.rm=TRUE)

#Final tidy data set and second data set with the average of each variable for each activity and each subject.
write.table(meanstdMeasurements, "tidyData.txt") 
write.table(secondData,"secondData.txt",row.name=FALSE) 

