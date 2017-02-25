---
title: "Getting and Cleaning Data Final - Codebook"
author: "Richard Noordam"
date: "February 24, 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Data Cleaning Codebook

## Data Flow
###0. About the Data
Data Detail: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

+ this provides the details about the data being processed.

###1. Data Acquisition - Acquire data and place it in local working directory
Base Data: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  

+ The first step is to acquire the data, and data detail from the following above location

+ For processing, the base data is assumed to be unzipped and in the current working directory, with the original directory structure and files.

###2. Dependencies
+ this script uses the dplyr library

###3. Data Load - load all data into data a frame.
+ Load Activity and Feature Names 
+ Load Training Data into dataframes 
+ Load Testing Data into dataframes
+ Load data into full joined set 

###4. Bind loaded data together.
+ Bind Training Data together, with Subject at end.
+ Bind Testing Data together, with Subject at end. 
+ Binding subject to the end allows easy connection of the feature names, keeping them in sequence.

###5. feature names housecleaning.
+ using of gsub to rename -std -> STD, -mean -> MEAN and getting rid of -(), making these names clear and simple to search on. (more tidy data work)

###6. subset features
+ get the columns that have MEAN or STD in them.
+ set final features
+ add subject and activity columns.
+ subset data based on this column set

###7. set the column names
+ set column names based on featureNames
+ lower case columns for preferred tidy data layout.

###8. Loop through Activities
+ and replace numeric representation of activity with activity name

###9. change the Activity and Subject columns to factors
+ this allows the means table to be based on these fields

###10. Create means table
+ create table, broken by activity, and subject, with removed activity and subject means (not needed or useful)

###11. Write out output
+ write tidyData.txt file with mean data.

## output variables
Variable list from the final clean data set
names(meanData)
 [1] "activity"                     "subject"                      "tbodyaccmeanx"               
 [4] "tbodyaccmeany"                "tbodyaccmeanz"                "tbodyaccstdx"                
 [7] "tbodyaccstdy"                 "tbodyaccstdz"                 "tgravityaccmeanx"            
[10] "tgravityaccmeany"             "tgravityaccmeanz"             "tgravityaccstdx"             
[13] "tgravityaccstdy"              "tgravityaccstdz"              "tbodyaccjerkmeanx"           
[16] "tbodyaccjerkmeany"            "tbodyaccjerkmeanz"            "tbodyaccjerkstdx"            
[19] "tbodyaccjerkstdy"             "tbodyaccjerkstdz"             "tbodygyromeanx"              
[22] "tbodygyromeany"               "tbodygyromeanz"               "tbodygyrostdx"               
[25] "tbodygyrostdy"                "tbodygyrostdz"                "tbodygyrojerkmeanx"          
[28] "tbodygyrojerkmeany"           "tbodygyrojerkmeanz"           "tbodygyrojerkstdx"           
[31] "tbodygyrojerkstdy"            "tbodygyrojerkstdz"            "tbodyaccmagmean"             
[34] "tbodyaccmagstd"               "tgravityaccmagmean"           "tgravityaccmagstd"           
[37] "tbodyaccjerkmagmean"          "tbodyaccjerkmagstd"           "tbodygyromagmean"            
[40] "tbodygyromagstd"              "tbodygyrojerkmagmean"         "tbodygyrojerkmagstd"         
[43] "fbodyaccmeanx"                "fbodyaccmeany"                "fbodyaccmeanz"               
[46] "fbodyaccstdx"                 "fbodyaccstdy"                 "fbodyaccstdz"                
[49] "fbodyaccmeanfreqx"            "fbodyaccmeanfreqy"            "fbodyaccmeanfreqz"           
[52] "fbodyaccjerkmeanx"            "fbodyaccjerkmeany"            "fbodyaccjerkmeanz"           
[55] "fbodyaccjerkstdx"             "fbodyaccjerkstdy"             "fbodyaccjerkstdz"            
[58] "fbodyaccjerkmeanfreqx"        "fbodyaccjerkmeanfreqy"        "fbodyaccjerkmeanfreqz"       
[61] "fbodygyromeanx"               "fbodygyromeany"               "fbodygyromeanz"              
[64] "fbodygyrostdx"                "fbodygyrostdy"                "fbodygyrostdz"               
[67] "fbodygyromeanfreqx"           "fbodygyromeanfreqy"           "fbodygyromeanfreqz"          
[70] "fbodyaccmagmean"              "fbodyaccmagstd"               "fbodyaccmagmeanfreq"         
[73] "fbodybodyaccjerkmagmean"      "fbodybodyaccjerkmagstd"       "fbodybodyaccjerkmagmeanfreq" 
[76] "fbodybodygyromagmean"         "fbodybodygyromagstd"          "fbodybodygyromagmeanfreq"    
[79] "fbodybodygyrojerkmagmean"     "fbodybodygyrojerkmagstd"      "fbodybodygyrojerkmagmeanfreq"
