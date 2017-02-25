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



###1. Data Acquisition - Acquire data and place it in local working directory
+ The first step is to acquire the data, and data detail from the following locations:
Base Datail: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Data Detail: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

+ The base data is assumed to be unzipped and in the current working directory, with the original directory structure included.

###2. Dependencies
+ this script uses the plyr library

###3. Data Load - load all data into data a frame.
+ Load Activity and Feature Names - variables: activityNames, featureNames
+ Load Training Data into dataframes - 
+ Load Testing Data into dataframes
+ Load data into full joined set - variable: FullSet

###4. Bind loaded data together.
+ Bind Training Data together, with Subject at end.
+ Bind Testing Data together, with Subject at end. 
++ This allows easy binding of testing and training by Subject.

###5. feature names housecleaning.
+ using of gsub to rename -std -> Std, -mean -> Mean and getting rid of -(), making these names clear and simple to search on.

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

###9. change the added columns to factors (tidy data preferred)

###10. Create means table broken by activity, and subject

###11. Write out output tidyData.txt file with mean data in it.








