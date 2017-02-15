

This document contains additional information about the run_analysis.R script.
 
-Information about the data used may be found at

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones\

-The run_analysis.R script does the following (in order):

1. Reads the tables containing the description of the activities and the features extracted from the raw data.
2. Reads all the files from the folder train.
3. Organizes the files that have been read by providing them with column names. Creates an organized file containing proper column names called trainFinal.
4. Reads all the files from the folder test.
5. Same as 5. testFinal created.
6. Combines the two tables - trainFinal and testFinal to create finalData.
7. Creates two files containing combined information from the train and test folders - one for activities and one for subjects.
8. Extracts all names containing 'mean' or 'std' from the features table.
9. Subsets the data from finalData for the names extracted in the previous step.
10. Adds activity names and subject IDs to the data obtained above.
11. Removes special characters \\(\\) and - and from column names to increase readability.
12. Creates a second, independent tidy data set with the average of each variable for each activity and subject.
13. Creates two new files - 'tidyData.txt' that contains the measurements of the mean and standard deviation for each measurement with proper column names and descriptive activity names and;
	'secondData.txt'94 which contains a second, independent tidy data set with the average of each variable for each activity and each subject from tidyData.txt


Key Columns

1. subjectID: ID numbers of the 30 subjects.
2. Activity: Descriptions of the activities.

-Rest of the Columns:

 [1] "subjectID"                    "Activity"                    \
 [3] "activityID"                   "tBodyAccmeanX"               \
 [5] "tBodyAccmeanY"                "tBodyAccmeanZ"               \
 [7] "tGravityAccmeanX"             "tGravityAccmeanY"            \
 [9] "tGravityAccmeanZ"             "tBodyAccJerkmeanX"           \
[11] "tBodyAccJerkmeanY"            "tBodyAccJerkmeanZ"           \
[13] "tBodyGyromeanX"               "tBodyGyromeanY"              \
[15] "tBodyGyromeanZ"               "tBodyGyroJerkmeanX"          \
[17] "tBodyGyroJerkmeanY"           "tBodyGyroJerkmeanZ"          \
[19] "tBodyAccMagmean"              "tGravityAccMagmean"          \
[21] "tBodyAccJerkMagmean"          "tBodyGyroMagmean"            \
[23] "tBodyGyroJerkMagmean"         "fBodyAccmeanX"               \
[25] "fBodyAccmeanY"                "fBodyAccmeanZ"               \
[27] "fBodyAccmeanFreqX"            "fBodyAccmeanFreqY"           \
[29] "fBodyAccmeanFreqZ"            "fBodyAccJerkmeanX"           \
[31] "fBodyAccJerkmeanY"            "fBodyAccJerkmeanZ"           \
[33] "fBodyAccJerkmeanFreqX"        "fBodyAccJerkmeanFreqY"       \
[35] "fBodyAccJerkmeanFreqZ"        "fBodyGyromeanX"              \
[37] "fBodyGyromeanY"               "fBodyGyromeanZ"              \
[39] "fBodyGyromeanFreqX"           "fBodyGyromeanFreqY"          \
[41] "fBodyGyromeanFreqZ"           "fBodyAccMagmean"             \
[43] "fBodyAccMagmeanFreq"          "fBodyBodyAccJerkMagmean"     \
[45] "fBodyBodyAccJerkMagmeanFreq"  "fBodyBodyGyroMagmean"        \
[47] "fBodyBodyGyroMagmeanFreq"     "fBodyBodyGyroJerkMagmean"    \
[49] "fBodyBodyGyroJerkMagmeanFreq" "tBodyAccstdX"                \
[51] "tBodyAccstdY"                 "tBodyAccstdZ"                \
[53] "tGravityAccstdX"              "tGravityAccstdY"             \
[55] "tGravityAccstdZ"              "tBodyAccJerkstdX"            \
[57] "tBodyAccJerkstdY"             "tBodyAccJerkstdZ"            \
[59] "tBodyGyrostdX"                "tBodyGyrostdY"               \
[61] "tBodyGyrostdZ"                "tBodyGyroJerkstdX"           \
[63] "tBodyGyroJerkstdY"            "tBodyGyroJerkstdZ"           \
[65] "tBodyAccMagstd"               "tGravityAccMagstd"           \
[67] "tBodyAccJerkMagstd"           "tBodyGyroMagstd"             \
[69] "tBodyGyroJerkMagstd"          "fBodyAccstdX"                \
[71] "fBodyAccstdY"                 "fBodyAccstdZ"                \
[73] "fBodyAccJerkstdX"             "fBodyAccJerkstdY"            \
[75] "fBodyAccJerkstdZ"             "fBodyGyrostdX"               \
[77] "fBodyGyrostdY"                "fBodyGyrostdZ"               \
[79] "fBodyAccMagstd"               "fBodyBodyAccJerkMagstd"      \
[81] "fBodyBodyGyroMagstd"          "fBodyBodyGyroJerkMagstd"     \

