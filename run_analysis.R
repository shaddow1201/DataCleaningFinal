# 2. Dependencies
library(dplyr)

# 3. LOad Data
  # load activity  and feature names/labels.
  activityNames <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
  featureNames <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

  # load training data into dataframes
  trainingX <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
  trainingY <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
  trainingSubject <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

  # load testing data into datasets
  testingX <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
  testingY <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
  testingSubject <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

# 4. Bind Data Together.
  # bind training dataframes together
  trainingFullData <- bind_cols(list(trainingX, trainingY, trainingSubject ))
  # bind testing files data together
  testingFullData <- bind_cols(list(testingX, testingY, testingSubject ))
  # bind both sets together.
  FullSet <- rbind(trainingFullData, testingFullData)
  
  
  # clean up start up variables.
  rm(list=c("testingFullData","testingSubject","testingX","testingY","trainingFullData","trainingSubject","trainingX","trainingY"))
  
# 5. name housecleaning so it's more meaningful/simpler  
  # change -std to std
  featureNames[,2] = gsub('-std', 'STD', featureNames[,2])
  # change -mean to Mean
  featureNames[,2] = gsub('-mean', 'MEAN', featureNames[,2])
  # get rid of extr -()  
  featureNames[,2] = gsub('[-()]', '', featureNames[,2])
  
# 6. determine the columns to keep.
  # get columns that have MEAN or STD, and add subject and activity
  finalCols <- grep(".*MEAN.*|.*STD.*", featureNames[,2])
  finalFeatures <- featureNames[finalCols,]
  finalCols <- union(finalCols, c(562, 563))
  # Limit/Remove those columns.
  finalData <- FullSet[,finalCols]

# 7. Set column names
  colnames(finalData) <- c(finalFeatures$V2, "Activity", "Subject")
  # tidy data requires lower case column names
  colnames(finalData) <- tolower(colnames(finalData))

# 8.  tidy data requires activity lables replace numerics
  currentActivity = 1
  for (activityLabel in activityNames$V2){
    # loop thru each activity and replace value
    finalData$activity <- gsub(currentActivity, activityLabel, finalData$activity)
    currentActivity <- currentActivity + 1
  }

# 9. change subject and activity to factor variables 
  finalData$subject <- as.factor(finalData$subject)
  finalData$activity <- as.factor(finalData$activity)
  
# 10. Create table of means
  meanData  <- aggregate(finalData, by=list(activity=finalData$activity, subject=finalData$subject), mean)
  # remove means of subject and activity (irrelevant)
  meanData <- meanData[,1:81] 
#11. write out final dataset for turn in.  
  write.table(meanData, "tidyData.txt", sep="\t", row.name=FALSE)
# variable clean up
  rm(list=c("finalCols","currentActivity","activityLabel", "activityNames", "featureNames", "finalData", "finalFeatures", "FullSet"))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  